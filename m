From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79518] nouveau causes lockup and reboot on GT215
Date: Wed, 06 Apr 2016 07:48:10 +0000
Message-ID: <bug-79518-8800-dxJMmFM7xt@http.bugs.freedesktop.org/>
References: <bug-79518-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0487438603=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79518-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0487438603==
Content-Type: multipart/alternative; boundary="14599288901.07c4.27495";
 charset="UTF-8"


--14599288901.07c4.27495
Date: Wed, 6 Apr 2016 07:48:10 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=79518

--- Comment #2 from Adam Borowski <kilobyte-b9QjgO8OEXPVItvQsEIGlw@public.gmane.org> ---
Created attachment 122750
  --> https://bugs.freedesktop.org/attachment.cgi?id=122750&action=edit
syslog with kernel 4.6-rc2

With kernel 4.6-rc2, there's some new output, including a stack trace.
The frequency of crashes seems to be lower, before it crashed reliably after no
longer than an hour, here's the first and so far only crash after ~2 days of
trying nouveau instead of proprietary.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14599288901.07c4.27495
Date: Wed, 6 Apr 2016 07:48:10 +0000
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
   title="NEW - nouveau causes lockup and reboot on GT215"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79518#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau causes lockup and reboot on GT215"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79518">bug 79518</a>
              from <span class="vcard"><a class="email" href="mailto:kilobyte&#64;angband.pl" title="Adam Borowski &lt;kilobyte&#64;angband.pl&gt;"> <span class="fn">Adam Borowski</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=122750" name="attach_122750" title="syslog with kernel 4.6-rc2">attachment 122750</a> <a href="attachment.cgi?id=122750&amp;action=edit" title="syslog with kernel 4.6-rc2">[details]</a></span>
syslog with kernel 4.6-rc2

With kernel 4.6-rc2, there's some new output, including a stack trace.
The frequency of crashes seems to be lower, before it crashed reliably after no
longer than an hour, here's the first and so far only crash after ~2 days of
trying nouveau instead of proprietary.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14599288901.07c4.27495--

--===============0487438603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0487438603==--
