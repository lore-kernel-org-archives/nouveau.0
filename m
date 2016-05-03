From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93887] [NV96] Amilo Xi 3650: G96M [GeForce 9600M
 GT]: HDMI monitor stays black after s2ram
Date: Tue, 03 May 2016 18:06:49 +0000
Message-ID: <bug-93887-8800-D7o9cPH9qI@http.bugs.freedesktop.org/>
References: <bug-93887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0863493723=="
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


--===============0863493723==
Content-Type: multipart/alternative; boundary="14622988091.7dFe.30241";
 charset="UTF-8"


--14622988091.7dFe.30241
Date: Tue, 3 May 2016 18:06:49 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93887

--- Comment #32 from Elmar Stellnberger <estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org> ---
  In the very beginning VGA monitors and the integrated display came up well at
least on the Xi3650. In the very beginning there was also another suspend bug
with the H265 which is already resolved (The H265 had formerly crashed in 95%
of all cases; however for 5% it behaved like the Xi3650; as far as I can tell;
i.e. bringing the integrated display up but not the HDMI display).

  Things have changed now and the integrated display does not come up again any
more after suspend. However the crashes for the H265 I am currently testing on
were resolved (i.e. there is only a way forward). As none of the displays
currently comes up (neither the integrated LVDS nor the external HDMI) I would
not expect a VGA display to come up.

  It is the way that from the BIOS only the integrated display becomes enabled
on boot and no external monitor so the integrated display coming no more up
after suspend may even be a 'good sign' of the kernel no more relying on the
BIOS/ACPI for this but taking things in its own hand as the proprietary Nvidia
driver does which can re-enable HDMI monitors after suspend well.

.- testing is never way easy - and so is reading and entending bug reports :/

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14622988091.7dFe.30241
Date: Tue, 3 May 2016 18:06:49 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93887#c32">Comment # 32</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV96] Amilo Xi 3650: G96M [GeForce 9600M GT]: HDMI monitor stays black after s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93887">bug 93887</a>
              from <span class="vcard"><a class="email" href="mailto:estellnb&#64;elstel.org" title="Elmar Stellnberger &lt;estellnb&#64;elstel.org&gt;"> <span class="fn">Elmar Stellnberger</span></a>
</span></b>
        <pre>  In the very beginning VGA monitors and the integrated display came up well at
least on the Xi3650. In the very beginning there was also another suspend bug
with the H265 which is already resolved (The H265 had formerly crashed in 95%
of all cases; however for 5% it behaved like the Xi3650; as far as I can tell;
i.e. bringing the integrated display up but not the HDMI display).

  Things have changed now and the integrated display does not come up again any
more after suspend. However the crashes for the H265 I am currently testing on
were resolved (i.e. there is only a way forward). As none of the displays
currently comes up (neither the integrated LVDS nor the external HDMI) I would
not expect a VGA display to come up.

  It is the way that from the BIOS only the integrated display becomes enabled
on boot and no external monitor so the integrated display coming no more up
after suspend may even be a 'good sign' of the kernel no more relying on the
BIOS/ACPI for this but taking things in its own hand as the proprietary Nvidia
driver does which can re-enable HDMI monitors after suspend well.

.- testing is never way easy - and so is reading and entending bug reports :/</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14622988091.7dFe.30241--

--===============0863493723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0863493723==--
