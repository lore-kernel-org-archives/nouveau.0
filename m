From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93887] [NV96] Amilo Xi 3650: G96M [GeForce 9600M
 GT]: HDMI monitor stays black after s2ram
Date: Tue, 03 May 2016 14:34:10 +0000
Message-ID: <bug-93887-8800-k1xgJjo0Wn@http.bugs.freedesktop.org/>
References: <bug-93887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2042610209=="
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


--===============2042610209==
Content-Type: multipart/alternative; boundary="14622860502.B6cBc.6991";
 charset="UTF-8"


--14622860502.B6cBc.6991
Date: Tue, 3 May 2016 14:34:10 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93887

--- Comment #21 from Elmar Stellnberger <estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org> ---
Created attachment 123438
  --> https://bugs.freedesktop.org/attachment.cgi?id=123438&action=edit
journalctl -x --since "2016-03-05 14:00:00" (4.6.0-rc6-ARCH-00006-g7d92f59)

> journalctl -x --since "2016-03-05 14:00:00" >journal-rc6.2
Failed to get journal fields: Ungültige Nachricht (invalid message)

Pierre; now it should also have captured resume. However I am still wondering
about the error message that journalctl spies out. I hope that everything which
is needed would be in the log; otherwise I could retry it with "systemctl
supsend; sleep 60; dmesg >rc6-suspend.dmesg; shutdown now;". You were right; I
had forgotten a sleep in between on my first approach.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14622860502.B6cBc.6991
Date: Tue, 3 May 2016 14:34:10 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93887#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV96] Amilo Xi 3650: G96M [GeForce 9600M GT]: HDMI monitor stays black after s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93887">bug 93887</a>
              from <span class="vcard"><a class="email" href="mailto:estellnb&#64;elstel.org" title="Elmar Stellnberger &lt;estellnb&#64;elstel.org&gt;"> <span class="fn">Elmar Stellnberger</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=123438" name="attach_123438" title="journalctl -x --since &quot;2016-03-05 14:00:00&quot; (4.6.0-rc6-ARCH-00006-g7d92f59)">attachment 123438</a> <a href="attachment.cgi?id=123438&amp;action=edit" title="journalctl -x --since &quot;2016-03-05 14:00:00&quot; (4.6.0-rc6-ARCH-00006-g7d92f59)">[details]</a></span>
journalctl -x --since &quot;2016-03-05 14:00:00&quot; (4.6.0-rc6-ARCH-00006-g7d92f59)

<span class="quote">&gt; journalctl -x --since &quot;2016-03-05 14:00:00&quot; &gt;journal-rc6.2</span >
Failed to get journal fields: Ungültige Nachricht (invalid message)

Pierre; now it should also have captured resume. However I am still wondering
about the error message that journalctl spies out. I hope that everything which
is needed would be in the log; otherwise I could retry it with &quot;systemctl
supsend; sleep 60; dmesg &gt;rc6-suspend.dmesg; shutdown now;&quot;. You were right; I
had forgotten a sleep in between on my first approach.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14622860502.B6cBc.6991--

--===============2042610209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2042610209==--
