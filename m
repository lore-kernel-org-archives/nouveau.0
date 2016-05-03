From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93887] [NV96] Amilo Xi 3650: G96M [GeForce 9600M
 GT]: HDMI monitor stays black after s2ram
Date: Tue, 03 May 2016 12:30:59 +0000
Message-ID: <bug-93887-8800-ibuYok1zbB@http.bugs.freedesktop.org/>
References: <bug-93887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1461501268=="
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


--===============1461501268==
Content-Type: multipart/alternative; boundary="14622786581.b9bd67F.6076";
 charset="UTF-8"


--14622786581.b9bd67F.6076
Date: Tue, 3 May 2016 12:30:58 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93887

--- Comment #19 from Elmar Stellnberger <estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org> ---
Created attachment 123436
  --> https://bugs.freedesktop.org/attachment.cgi?id=123436&action=edit
journalctl -xb with 4.6.0-rc6-ARCH-00006-g7d92f59

Today I have re-tested s2ram with the Celsius H265; the machine came up again;
the screen content was shown for short but then immediately thereafter falling
black. The machine was working ok after s2ram; i.e. the shell executed the
command after systemctl suspend correctly (which was journalctl -xb
>journal-rc6). The screen did not come up again thereafter no matter which keys
I had pressed so that I finally exited with the SysRQ keys.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14622786581.b9bd67F.6076
Date: Tue, 3 May 2016 12:30:58 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93887#c19">Comment # 19</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV96] Amilo Xi 3650: G96M [GeForce 9600M GT]: HDMI monitor stays black after s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93887">bug 93887</a>
              from <span class="vcard"><a class="email" href="mailto:estellnb&#64;elstel.org" title="Elmar Stellnberger &lt;estellnb&#64;elstel.org&gt;"> <span class="fn">Elmar Stellnberger</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=123436" name="attach_123436" title="journalctl -xb with 4.6.0-rc6-ARCH-00006-g7d92f59">attachment 123436</a> <a href="attachment.cgi?id=123436&amp;action=edit" title="journalctl -xb with 4.6.0-rc6-ARCH-00006-g7d92f59">[details]</a></span>
journalctl -xb with 4.6.0-rc6-ARCH-00006-g7d92f59

Today I have re-tested s2ram with the Celsius H265; the machine came up again;
the screen content was shown for short but then immediately thereafter falling
black. The machine was working ok after s2ram; i.e. the shell executed the
command after systemctl suspend correctly (which was journalctl -xb
<span class="quote">&gt;journal-rc6). The screen did not come up again thereafter no matter which keys</span >
I had pressed so that I finally exited with the SysRQ keys.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14622786581.b9bd67F.6076--

--===============1461501268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1461501268==--
