From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31961] [NV4E] [drm:drm_crtc_helper_set_config]
 *ERROR* failed to set mode on [CRTC:6]
Date: Wed, 23 Oct 2013 07:13:53 +0000
Message-ID: <bug-31961-8800-Pnv7PNjzZt@http.bugs.freedesktop.org/>
References: <bug-31961-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0270225901=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31961-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0270225901==
Content-Type: multipart/alternative; boundary="1382512433.D288b2.27864"; charset="us-ascii"


--1382512433.D288b2.27864
Date: Wed, 23 Oct 2013 07:13:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=31961

--- Comment #16 from Salah Coronya <salah.coronya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 88024
  --> https://bugs.freedesktop.org/attachment.cgi?id=88024&action=edit
EDID (retrieved from sysfs)

Passing drm_kms_helper.edid_firmware=edid/1280x1024.bin to the kernel command
line seems to fix the problem as well.

Otput of parse-edid: 

parse-edid: parse-edid version 2.0.0
parse-edid: EDID checksum passed.

    # EDID version 1 revision 3
Section "Monitor"
    # Block type: 2:0 3:fd
    # Block type: 2:0 3:fc
    Identifier "KDS XF-70 "
    VendorName "STC"
    ModelName "KDS XF-70 "
    # Block type: 2:0 3:fd
    HorizSync 30-72
    VertRefresh 50-160
    # Max dot clock (video bandwidth) 110 MHz
    # Block type: 2:0 3:fc
    # Block type: 2:0 3:ff
    # DPMS capabilities: Active off:yes  Suspend:yes  Standby:yes

    Mode     "1024x768"    # vfreq 75.029Hz, hfreq 60.023kHz
        DotClock    78.750000
        HTimings    1024 1040 1136 1312
        VTimings    768 769 772 800
        Flags    "+HSync" "+VSync"
    EndMode
    # Block type: 2:0 3:fd
    # Block type: 2:0 3:fc
    # Block type: 2:0 3:ff
EndSection

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1382512433.D288b2.27864
Date: Wed, 23 Oct 2013 07:13:53 +0000
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
   title="NEW --- - [NV4E] [drm:drm_crtc_helper_set_config] *ERROR* failed to set mode on [CRTC:6]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=31961#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4E] [drm:drm_crtc_helper_set_config] *ERROR* failed to set mode on [CRTC:6]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=31961">bug 31961</a>
              from <span class="vcard"><a class="email" href="mailto:salah.coronya&#64;gmail.com" title="Salah Coronya &lt;salah.coronya&#64;gmail.com&gt;"> <span class="fn">Salah Coronya</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=88024" name="attach_88024" title="EDID (retrieved from sysfs)">attachment 88024</a> <a href="attachment.cgi?id=88024&amp;action=edit" title="EDID (retrieved from sysfs)">[details]</a></span>
EDID (retrieved from sysfs)

Passing drm_kms_helper.edid_firmware=edid/1280x1024.bin to the kernel command
line seems to fix the problem as well.

Otput of parse-edid: 

parse-edid: parse-edid version 2.0.0
parse-edid: EDID checksum passed.

    # EDID version 1 revision 3
Section &quot;Monitor&quot;
    # Block type: 2:0 3:fd
    # Block type: 2:0 3:fc
    Identifier &quot;KDS XF-70 &quot;
    VendorName &quot;STC&quot;
    ModelName &quot;KDS XF-70 &quot;
    # Block type: 2:0 3:fd
    HorizSync 30-72
    VertRefresh 50-160
    # Max dot clock (video bandwidth) 110 MHz
    # Block type: 2:0 3:fc
    # Block type: 2:0 3:ff
    # DPMS capabilities: Active off:yes  Suspend:yes  Standby:yes

    Mode     &quot;1024x768&quot;    # vfreq 75.029Hz, hfreq 60.023kHz
        DotClock    78.750000
        HTimings    1024 1040 1136 1312
        VTimings    768 769 772 800
        Flags    &quot;+HSync&quot; &quot;+VSync&quot;
    EndMode
    # Block type: 2:0 3:fd
    # Block type: 2:0 3:fc
    # Block type: 2:0 3:ff
EndSection</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1382512433.D288b2.27864--

--===============0270225901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0270225901==--
