package com.example.infact.controllers;

import com.example.infact.models.Product;
import com.example.infact.services.ProductService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.UUID;

@Controller //Чтобы не инициализировать private final ProductService productService;
public class ProductController {
    private final ProductService productService;

    @Value("${upload.path}")
    private String uploadPath;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }
    @GetMapping("/")
    public String products(
            @RequestParam(name = "title", required = false) String title,
            Principal principal, Model model) {
        model.addAttribute("products",
                productService.listProducts(title));
        model.addAttribute("user",
                productService.getUserByPrincipal(principal));
        return "products";
    }
    @GetMapping("/product/{id}")
    public String productInfo(@PathVariable Long id, Model model) {
        Product product = productService.getProductById(id);
        model.addAttribute("product", product);
        return "/product-info";
    }
    @PostMapping("/product/create")
    public String createProduct(@RequestParam("file1") MultipartFile file1,
                                Product product,
                                Principal principal) throws IOException {
        if (file1 != null){
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()){
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file1.getOriginalFilename();
            file1.transferTo(new File(uploadPath+"/"+resultFileName));
            product.setNameOfFile(resultFileName);
        }
        productService.saveProduct(principal,product);
        return "redirect:/";
    }
    @PostMapping("/product/delete/{id}")
    public String deleteProduct(@PathVariable Long id) {
        productService.deleteProduct(id);
        return "redirect:/";
    }
}
