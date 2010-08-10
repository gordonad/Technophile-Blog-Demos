package com.gordondickens.simail.web;

import com.gordondickens.simail.entity.Recipient;
import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import org.springframework.core.convert.converter.Converter;
import org.springframework.core.convert.support.GenericConversionService;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect RecipientController_Roo_Controller {
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String RecipientController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("recipient", new Recipient());
        return "recipients/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String RecipientController.show(@PathVariable("id") Long id, ModelMap modelMap) {
        modelMap.addAttribute("recipient", Recipient.findRecipient(id));
        return "recipients/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String RecipientController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("recipients", Recipient.findRecipientEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Recipient.countRecipients() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("recipients", Recipient.findAllRecipients());
        }
        return "recipients/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String RecipientController.update(@Valid Recipient recipient, BindingResult result, ModelMap modelMap) {
        if (result.hasErrors()) {
            modelMap.addAttribute("recipient", recipient);
            return "recipients/update";
        }
        recipient.merge();
        return "redirect:/recipients/" + recipient.getId();
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String RecipientController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {
        modelMap.addAttribute("recipient", Recipient.findRecipient(id));
        return "recipients/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String RecipientController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        Recipient.findRecipient(id).remove();
        return "redirect:/recipients?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    Converter<Recipient, String> RecipientController.getRecipientConverter() {
        return new Converter<Recipient, String>() {
            public String convert(Recipient recipient) {
                return new StringBuilder().append(recipient.getRecipientEmail()).append(" ").append(recipient.getSubject()).append(" ").append(recipient.getMessageBody()).toString();
            }
        };
    }
    
    @InitBinder
    void RecipientController.registerConverters(WebDataBinder binder) {
        if (binder.getConversionService() instanceof GenericConversionService) {
            GenericConversionService conversionService = (GenericConversionService) binder.getConversionService();
            conversionService.addConverter(getRecipientConverter());
        }
    }
    
}
