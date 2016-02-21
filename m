From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93887] [NV96] Amilo Xi 3650: G96M [GeForce 9600M
 GT]: HDMI monitor stays black after s2ram
Date: Sun, 21 Feb 2016 13:49:32 +0000
Message-ID: <bug-93887-8800-ryMbsVhpMw@http.bugs.freedesktop.org/>
References: <bug-93887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1397908021=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93887-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1397908021==
Content-Type: multipart/alternative; boundary="14560625721.2618.16230";
 charset="UTF-8"


--14560625721.2618.16230
Date: Sun, 21 Feb 2016 13:49:32 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93887

--- Comment #7 from Elmar Stellnberger <estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org> ---
Now, I have compiled and installed suspend-utils and tested s2ram with the
following parameters:
s2ram --no_kms no_kms --nofbsuspend --force --pci_save --acpi_sleep=1
s2ram --no_kms no_kms --nofbsuspend --force

... and the result is still the same as with a pure systemctl suspend: the
external HDMI monitor stays black while the integrated LVDS comes up well.
Possibly these tests could point you in the right direction when searching for
an error why the external monitor does not come up again. Likely not a simple
KMS issue; perhaps some extra code would be needed to post the HDMI port or so.
  Anyone here who could tell me the relevance of these test results?

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14560625721.2618.16230
Date: Sun, 21 Feb 2016 13:49:32 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV96] Amilo Xi 3650: G96M [GeForce 9600M GT]: HDMI monitor stays black after s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93887#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV96] Amilo Xi 3650: G96M [GeForce 9600M GT]: HDMI monitor stays black after s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93887">bug 93887</a>
              from <span class="vcard"><a class="email" href="mailto:estellnb&#64;elstel.org" title="Elmar Stellnberger &lt;estellnb&#64;elstel.org&gt;"> <span class="fn">Elmar Stellnberger</span></a>
</span></b>
        <pre>Now, I have compiled and installed suspend-utils and tested s2ram with the
following parameters:
s2ram --no_kms no_kms --nofbsuspend --force --pci_save --acpi_sleep=1
s2ram --no_kms no_kms --nofbsuspend --force

... and the result is still the same as with a pure systemctl suspend: the
external HDMI monitor stays black while the integrated LVDS comes up well.
Possibly these tests could point you in the right direction when searching for
an error why the external monitor does not come up again. Likely not a simple
KMS issue; perhaps some extra code would be needed to post the HDMI port or so.
  Anyone here who could tell me the relevance of these test results?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14560625721.2618.16230--

--===============1397908021==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1397908021==--
