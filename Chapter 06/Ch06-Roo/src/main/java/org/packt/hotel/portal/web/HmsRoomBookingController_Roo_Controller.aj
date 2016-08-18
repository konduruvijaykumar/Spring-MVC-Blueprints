// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.packt.hotel.portal.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.packt.hotel.portal.jpa.data.HmsMenuBooking;
import org.packt.hotel.portal.jpa.data.HmsRoomBooking;
import org.packt.hotel.portal.jpa.data.HmsRoomsMasterlist;
import org.packt.hotel.portal.jpa.data.HmsUserProfile;
import org.packt.hotel.portal.web.HmsRoomBookingController;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect HmsRoomBookingController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String HmsRoomBookingController.create(@Valid HmsRoomBooking hmsRoomBooking, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, hmsRoomBooking);
            return "hmsroombookings/create";
        }
        uiModel.asMap().clear();
        hmsRoomBooking.persist();
        return "redirect:/hmsroombookings/" + encodeUrlPathSegment(hmsRoomBooking.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String HmsRoomBookingController.createForm(Model uiModel) {
        populateEditForm(uiModel, new HmsRoomBooking());
        return "hmsroombookings/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String HmsRoomBookingController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("hmsroombooking", HmsRoomBooking.findHmsRoomBooking(id));
        uiModel.addAttribute("itemId", id);
        return "hmsroombookings/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String HmsRoomBookingController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("hmsroombookings", HmsRoomBooking.findHmsRoomBookingEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) HmsRoomBooking.countHmsRoomBookings() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("hmsroombookings", HmsRoomBooking.findAllHmsRoomBookings(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "hmsroombookings/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String HmsRoomBookingController.update(@Valid HmsRoomBooking hmsRoomBooking, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, hmsRoomBooking);
            return "hmsroombookings/update";
        }
        uiModel.asMap().clear();
        hmsRoomBooking.merge();
        return "redirect:/hmsroombookings/" + encodeUrlPathSegment(hmsRoomBooking.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String HmsRoomBookingController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, HmsRoomBooking.findHmsRoomBooking(id));
        return "hmsroombookings/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String HmsRoomBookingController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        HmsRoomBooking hmsRoomBooking = HmsRoomBooking.findHmsRoomBooking(id);
        hmsRoomBooking.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/hmsroombookings";
    }
    
    void HmsRoomBookingController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("hmsRoomBooking_bookingdate_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
    void HmsRoomBookingController.populateEditForm(Model uiModel, HmsRoomBooking hmsRoomBooking) {
        uiModel.addAttribute("hmsRoomBooking", hmsRoomBooking);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("hmsmenubookings", HmsMenuBooking.findAllHmsMenuBookings());
        uiModel.addAttribute("hmsroomsmasterlists", HmsRoomsMasterlist.findAllHmsRoomsMasterlists());
        uiModel.addAttribute("hmsuserprofiles", HmsUserProfile.findAllHmsUserProfiles());
    }
    
    String HmsRoomBookingController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
