From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93887] [NV96] Amilo Xi 3650: G96M [GeForce 9600M
 GT]: HDMI monitor stays black after s2ram
Date: Thu, 28 Apr 2016 12:40:24 +0000
Message-ID: <bug-93887-8800-MaNXvC3Xnx@http.bugs.freedesktop.org/>
References: <bug-93887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0297257301=="
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


--===============0297257301==
Content-Type: multipart/alternative; boundary="14618472240.F839.26141";
 charset="UTF-8"


--14618472240.F839.26141
Date: Thu, 28 Apr 2016 12:40:24 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93887

--- Comment #18 from Elmar Stellnberger <estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org> ---
Created attachment 123319
  --> https://bugs.freedesktop.org/attachment.cgi?id=123319&action=edit
journal including 2x s2ram with 4.6.0-rc5-ARCH-00005-g0b20a43

4.6.0-rc5-ARCH-00005-g0b20a43: Now the machine comes up fine (tested two times
on FTS Celsius H265) but both displays (integrated+external) stay black after
s2ram. The old screen content does not even flash up for a short time. Num-Lock
+ SysRq Keys work fine after s2ram.

P.S.: there was an error trying to capture the logs:
 journalctl -x --since "2016-04-28" >journal
Failed to get journal fields: Ungültige Nachricht
(it says 'invalid message').

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14618472240.F839.26141
Date: Thu, 28 Apr 2016 12:40:24 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93887#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV96] Amilo Xi 3650: G96M [GeForce 9600M GT]: HDMI monitor stays black after s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93887">bug 93887</a>
              from <span class="vcard"><a class="email" href="mailto:estellnb&#64;elstel.org" title="Elmar Stellnberger &lt;estellnb&#64;elstel.org&gt;"> <span class="fn">Elmar Stellnberger</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=123319" name="attach_123319" title="journal including 2x s2ram with 4.6.0-rc5-ARCH-00005-g0b20a43">attachment 123319</a> <a href="attachment.cgi?id=123319&amp;action=edit" title="journal including 2x s2ram with 4.6.0-rc5-ARCH-00005-g0b20a43">[details]</a></span>
journal including 2x s2ram with 4.6.0-rc5-ARCH-00005-g0b20a43

4.6.0-rc5-ARCH-00005-g0b20a43: Now the machine comes up fine (tested two times
on FTS Celsius H265) but both displays (integrated+external) stay black after
s2ram. The old screen content does not even flash up for a short time. Num-Lock
+ SysRq Keys work fine after s2ram.

P.S.: there was an error trying to capture the logs:
 journalctl -x --since &quot;2016-04-28&quot; &gt;journal
Failed to get journal fields: Ungültige Nachricht
(it says 'invalid message').</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14618472240.F839.26141--

--===============0297257301==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0297257301==--
