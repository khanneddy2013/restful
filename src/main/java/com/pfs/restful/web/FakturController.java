package com.pfs.restful.web;
import com.pfs.restful.domain.Faktur;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/fakturs")
@Controller
@RooWebScaffold(path = "fakturs", formBackingObject = Faktur.class)
public class FakturController {
}
