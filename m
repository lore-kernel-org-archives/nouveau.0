From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] Distorted graphics (double cursor) with
 GeForce 4200Go (NV28)
Date: Sun, 07 Jul 2013 14:00:30 +0000
Message-ID: <bug-54700-8800-W5Jj3Q6JFb@http.bugs.freedesktop.org/>
References: <bug-54700-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1594017458=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54700-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1594017458==
Content-Type: multipart/alternative; boundary="1373205629.bdCAf1.14551"; charset="us-ascii"


--1373205629.bdCAf1.14551
Date: Sun, 7 Jul 2013 14:00:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54700

--- Comment #11 from r.ductor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
... xrandr as seen from user account (forget the previous ones taken from root)
...

$ xrandr --verbose
Screen 0: minimum 320 x 200, current 1920 x 1200, maximum 4096 x 4096
VGA-1 disconnected (normal left inverted right x axis y axis)
        Identifier: 0x51
        Timestamp:  24877
        Subpixel:   unknown
        Clones:    
        CRTCs:      0
        Transform:  1.000000 0.000000 0.000000
                    0.000000 1.000000 0.000000
                    0.000000 0.000000 1.000000
                   filter: 
LVDS-1 connected 1920x1200+0+0 (0x54) normal (normal left inverted right x axis
y axis) 331mm x 207mm
        Identifier: 0x52
        Timestamp:  24877
        Subpixel:   unknown
        Gamma:      1.0:1.0:1.0
        Brightness: 1.0
        Clones:    
        CRTC:       1
        CRTCs:      1                                                           
        Transform:  1.000000 0.000000 0.000000                                  
                    0.000000 1.000000 0.000000                                  
                    0.000000 0.000000 1.000000                                  
                   filter:                                                      
        EDID:                                                                   
                00ffffffffffff004d109f1300000000                                
                200d0103802115780aa8a098554d8f26                                
                1f505400000001010101010101010101                                
                0101010101012f3f800871b023406420                                
                26004bcf100000190000000f00000000                                
                00000000002892025000000000fe0055                                
                30363734029a4d314c573032000000fe                                
                00c0b0a0908068480002010a202000a4                                
        scale: 1 (0x00000001)   range:  (0,2)                                   
        flicker reduction: 50 (0x00000032)      range:  (0,100)                 
        contrast: 50 (0x00000032)       range:  (0,100)                         
        brightness: 50 (0x00000032)     range:  (0,100)                         
        mode:   PAL                                                             
                supported: PAL          PAL-M        PAL-N        PAL-Nc        
                           PAL-60       NTSC-M       NTSC-J                     
        bottom margin: 50 (0x00000032)  range:  (0,100)                         
        left margin: 50 (0x00000032)    range:  (0,100)                         
        subconnector:   Unknown                                                 
                supported: Unknown      Composite    SVIDEO       Component     
                           SCART                                                
        select subconnector:    Automatic                                       
                supported: Automatic    Composite    SVIDEO       Component     
                           SCART                                                
        dithering mode: auto                                                    
                supported: auto         off          on                         
        scaling mode:   Full                                                    
                supported: None         Full         Center       Full aspect   
  1920x1200 (0x54)  161.8MHz -HSync -VSync *current +preferred                  
        h: width  1920 start 2020 end 2052 total 2184 skew    0 clock   74.1KHz 
        v: height 1200 start 1202 end 1208 total 1235           clock   60.0Hz  
  1920x1200 (0x55)  193.2MHz -HSync +VSync                                      
        h: width  1920 start 2056 end 2256 total 2592 skew    0 clock   74.6KHz
        v: height 1200 start 1203 end 1209 total 1245           clock   59.9Hz
  1920x1080 (0x56)  173.0MHz -HSync +VSync
        h: width  1920 start 2048 end 2248 total 2576 skew    0 clock   67.2KHz
        v: height 1080 start 1083 end 1088 total 1120           clock   60.0Hz
  1600x1200 (0x57)  161.0MHz -HSync +VSync
        h: width  1600 start 1712 end 1880 total 2160 skew    0 clock   74.5KHz
        v: height 1200 start 1203 end 1207 total 1245           clock   59.9Hz
  1680x1050 (0x58)  146.2MHz -HSync +VSync
        h: width  1680 start 1784 end 1960 total 2240 skew    0 clock   65.3KHz
        v: height 1050 start 1053 end 1059 total 1089           clock   60.0Hz
  1400x1050 (0x59)  121.8MHz -HSync +VSync
        h: width  1400 start 1488 end 1632 total 1864 skew    0 clock   65.3KHz
        v: height 1050 start 1053 end 1057 total 1089           clock   60.0Hz
  1280x1024 (0x5a)  109.0MHz -HSync +VSync
        h: width  1280 start 1368 end 1496 total 1712 skew    0 clock   63.7KHz
        v: height 1024 start 1027 end 1034 total 1063           clock   59.9Hz
  1280x960 (0x5b)  101.2MHz -HSync +VSync
        h: width  1280 start 1360 end 1488 total 1696 skew    0 clock   59.7KHz
        v: height  960 start  963 end  967 total  996           clock   59.9Hz
  1152x864 (0x5c)   81.8MHz -HSync +VSync
        h: width  1152 start 1216 end 1336 total 1520 skew    0 clock   53.8KHz
        v: height  864 start  867 end  871 total  897           clock   60.0Hz
  1024x768 (0x5d)   63.5MHz -HSync +VSync
        h: width  1024 start 1072 end 1176 total 1328 skew    0 clock   47.8KHz
        v: height  768 start  771 end  775 total  798           clock   59.9Hz
  800x600 (0x5e)   38.2MHz -HSync +VSync
        h: width   800 start  832 end  912 total 1024 skew    0 clock   37.4KHz
        v: height  600 start  603 end  607 total  624           clock   59.9Hz
  640x480 (0x5f)   23.8MHz -HSync +VSync
        h: width   640 start  664 end  720 total  800 skew    0 clock   29.7KHz
        v: height  480 start  483 end  487 total  500           clock   59.4Hz
  720x400 (0x60)   22.2MHz -HSync +VSync
        h: width   720 start  744 end  808 total  896 skew    0 clock   24.8KHz
        v: height  400 start  403 end  413 total  417           clock   59.6Hz
  640x400 (0x61)   20.0MHz -HSync +VSync
        h: width   640 start  664 end  720 total  800 skew    0 clock   25.0KHz
        v: height  400 start  403 end  409 total  417           clock   60.0Hz
  640x350 (0x62)   17.5MHz -HSync +VSync
        h: width   640 start  664 end  720 total  800 skew    0 clock   21.9KHz
        v: height  350 start  353 end  363 total  366           clock   59.8Hz
DVI-D-1 disconnected (normal left inverted right x axis y axis)
        Identifier: 0x53
        Timestamp:  24877
        Subpixel:   unknown
        Clones:    
        CRTCs:      0 1
        Transform:  1.000000 0.000000 0.000000
                    0.000000 1.000000 0.000000
                    0.000000 0.000000 1.000000
                   filter: 
        dithering mode: auto
                supported: auto         off          on          
        scaling mode:   Full
                supported: None         Full         Center       Full aspect 
$

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1373205629.bdCAf1.14551
Date: Sun, 7 Jul 2013 14:00:29 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
              from <span class="vcard"><a class="email" href="mailto:r.ductor&#64;gmail.com" title="r.ductor&#64;gmail.com">r.ductor&#64;gmail.com</a>
</span></b>
        <pre>... xrandr as seen from user account (forget the previous ones taken from root)
...

$ xrandr --verbose
Screen 0: minimum 320 x 200, current 1920 x 1200, maximum 4096 x 4096
VGA-1 disconnected (normal left inverted right x axis y axis)
        Identifier: 0x51
        Timestamp:  24877
        Subpixel:   unknown
        Clones:    
        CRTCs:      0
        Transform:  1.000000 0.000000 0.000000
                    0.000000 1.000000 0.000000
                    0.000000 0.000000 1.000000
                   filter: 
LVDS-1 connected 1920x1200+0+0 (0x54) normal (normal left inverted right x axis
y axis) 331mm x 207mm
        Identifier: 0x52
        Timestamp:  24877
        Subpixel:   unknown
        Gamma:      1.0:1.0:1.0
        Brightness: 1.0
        Clones:    
        CRTC:       1
        CRTCs:      1                                                           
        Transform:  1.000000 0.000000 0.000000                                  
                    0.000000 1.000000 0.000000                                  
                    0.000000 0.000000 1.000000                                  
                   filter:                                                      
        EDID:                                                                   
                00ffffffffffff004d109f1300000000                                
                200d0103802115780aa8a098554d8f26                                
                1f505400000001010101010101010101                                
                0101010101012f3f800871b023406420                                
                26004bcf100000190000000f00000000                                
                00000000002892025000000000fe0055                                
                30363734029a4d314c573032000000fe                                
                00c0b0a0908068480002010a202000a4                                
        scale: 1 (0x00000001)   range:  (0,2)                                   
        flicker reduction: 50 (0x00000032)      range:  (0,100)                 
        contrast: 50 (0x00000032)       range:  (0,100)                         
        brightness: 50 (0x00000032)     range:  (0,100)                         
        mode:   PAL                                                             
                supported: PAL          PAL-M        PAL-N        PAL-Nc        
                           PAL-60       NTSC-M       NTSC-J                     
        bottom margin: 50 (0x00000032)  range:  (0,100)                         
        left margin: 50 (0x00000032)    range:  (0,100)                         
        subconnector:   Unknown                                                 
                supported: Unknown      Composite    SVIDEO       Component     
                           SCART                                                
        select subconnector:    Automatic                                       
                supported: Automatic    Composite    SVIDEO       Component     
                           SCART                                                
        dithering mode: auto                                                    
                supported: auto         off          on                         
        scaling mode:   Full                                                    
                supported: None         Full         Center       Full aspect   
  1920x1200 (0x54)  161.8MHz -HSync -VSync *current +preferred                  
        h: width  1920 start 2020 end 2052 total 2184 skew    0 clock   74.1KHz 
        v: height 1200 start 1202 end 1208 total 1235           clock   60.0Hz  
  1920x1200 (0x55)  193.2MHz -HSync +VSync                                      
        h: width  1920 start 2056 end 2256 total 2592 skew    0 clock   74.6KHz
        v: height 1200 start 1203 end 1209 total 1245           clock   59.9Hz
  1920x1080 (0x56)  173.0MHz -HSync +VSync
        h: width  1920 start 2048 end 2248 total 2576 skew    0 clock   67.2KHz
        v: height 1080 start 1083 end 1088 total 1120           clock   60.0Hz
  1600x1200 (0x57)  161.0MHz -HSync +VSync
        h: width  1600 start 1712 end 1880 total 2160 skew    0 clock   74.5KHz
        v: height 1200 start 1203 end 1207 total 1245           clock   59.9Hz
  1680x1050 (0x58)  146.2MHz -HSync +VSync
        h: width  1680 start 1784 end 1960 total 2240 skew    0 clock   65.3KHz
        v: height 1050 start 1053 end 1059 total 1089           clock   60.0Hz
  1400x1050 (0x59)  121.8MHz -HSync +VSync
        h: width  1400 start 1488 end 1632 total 1864 skew    0 clock   65.3KHz
        v: height 1050 start 1053 end 1057 total 1089           clock   60.0Hz
  1280x1024 (0x5a)  109.0MHz -HSync +VSync
        h: width  1280 start 1368 end 1496 total 1712 skew    0 clock   63.7KHz
        v: height 1024 start 1027 end 1034 total 1063           clock   59.9Hz
  1280x960 (0x5b)  101.2MHz -HSync +VSync
        h: width  1280 start 1360 end 1488 total 1696 skew    0 clock   59.7KHz
        v: height  960 start  963 end  967 total  996           clock   59.9Hz
  1152x864 (0x5c)   81.8MHz -HSync +VSync
        h: width  1152 start 1216 end 1336 total 1520 skew    0 clock   53.8KHz
        v: height  864 start  867 end  871 total  897           clock   60.0Hz
  1024x768 (0x5d)   63.5MHz -HSync +VSync
        h: width  1024 start 1072 end 1176 total 1328 skew    0 clock   47.8KHz
        v: height  768 start  771 end  775 total  798           clock   59.9Hz
  800x600 (0x5e)   38.2MHz -HSync +VSync
        h: width   800 start  832 end  912 total 1024 skew    0 clock   37.4KHz
        v: height  600 start  603 end  607 total  624           clock   59.9Hz
  640x480 (0x5f)   23.8MHz -HSync +VSync
        h: width   640 start  664 end  720 total  800 skew    0 clock   29.7KHz
        v: height  480 start  483 end  487 total  500           clock   59.4Hz
  720x400 (0x60)   22.2MHz -HSync +VSync
        h: width   720 start  744 end  808 total  896 skew    0 clock   24.8KHz
        v: height  400 start  403 end  413 total  417           clock   59.6Hz
  640x400 (0x61)   20.0MHz -HSync +VSync
        h: width   640 start  664 end  720 total  800 skew    0 clock   25.0KHz
        v: height  400 start  403 end  409 total  417           clock   60.0Hz
  640x350 (0x62)   17.5MHz -HSync +VSync
        h: width   640 start  664 end  720 total  800 skew    0 clock   21.9KHz
        v: height  350 start  353 end  363 total  366           clock   59.8Hz
DVI-D-1 disconnected (normal left inverted right x axis y axis)
        Identifier: 0x53
        Timestamp:  24877
        Subpixel:   unknown
        Clones:    
        CRTCs:      0 1
        Transform:  1.000000 0.000000 0.000000
                    0.000000 1.000000 0.000000
                    0.000000 0.000000 1.000000
                   filter: 
        dithering mode: auto
                supported: auto         off          on          
        scaling mode:   Full
                supported: None         Full         Center       Full aspect 
$</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1373205629.bdCAf1.14551--

--===============1594017458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1594017458==--
