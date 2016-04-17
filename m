From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93887] [NV96] Amilo Xi 3650: G96M [GeForce 9600M
 GT]: HDMI monitor stays black after s2ram
Date: Sun, 17 Apr 2016 10:01:29 +0000
Message-ID: <bug-93887-8800-NyB6tk3J0Z@http.bugs.freedesktop.org/>
References: <bug-93887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1597156014=="
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


--===============1597156014==
Content-Type: multipart/alternative; boundary="14608872891.D6D00.7180";
 charset="UTF-8"


--14608872891.D6D00.7180
Date: Sun, 17 Apr 2016 10:01:29 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93887

--- Comment #17 from Elmar Stellnberger <estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org> ---
Created attachment 123007
  --> https://bugs.freedesktop.org/attachment.cgi?id=123007&action=edit
journal: delayed wakeup with Celsius on 4.6.0-rc2

  Now I have also tried it with the Celsius; s2ram has significantly improved
since my last test as the machine never crashed. At first bootup 3 s2rams
worked ok and at the second bootup the same problem as before seemed to appear:
the original screen content flashed up then the monitor turning black again
thereafter immediately. However this time Num Lock was still working and I
could make the machine come up again by pressing Ctrl-Alt-Entf on the
integrated keyboard (which I did for both s2ram tests on the second bootup
after a minute or so). External monitor staying black after s2ram; also here
with the Celsius and kernel 4.6.0-rc2.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14608872891.D6D00.7180
Date: Sun, 17 Apr 2016 10:01:29 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93887#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV96] Amilo Xi 3650: G96M [GeForce 9600M GT]: HDMI monitor stays black after s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93887">bug 93887</a>
              from <span class="vcard"><a class="email" href="mailto:estellnb&#64;elstel.org" title="Elmar Stellnberger &lt;estellnb&#64;elstel.org&gt;"> <span class="fn">Elmar Stellnberger</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=123007" name="attach_123007" title="journal: delayed wakeup with Celsius on 4.6.0-rc2">attachment 123007</a> <a href="attachment.cgi?id=123007&amp;action=edit" title="journal: delayed wakeup with Celsius on 4.6.0-rc2">[details]</a></span>
journal: delayed wakeup with Celsius on 4.6.0-rc2

  Now I have also tried it with the Celsius; s2ram has significantly improved
since my last test as the machine never crashed. At first bootup 3 s2rams
worked ok and at the second bootup the same problem as before seemed to appear:
the original screen content flashed up then the monitor turning black again
thereafter immediately. However this time Num Lock was still working and I
could make the machine come up again by pressing Ctrl-Alt-Entf on the
integrated keyboard (which I did for both s2ram tests on the second bootup
after a minute or so). External monitor staying black after s2ram; also here
with the Celsius and kernel 4.6.0-rc2.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14608872891.D6D00.7180--

--===============1597156014==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1597156014==--
