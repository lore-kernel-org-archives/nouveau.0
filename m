From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79518] nouveau causes lockup and reboot on GT215
Date: Wed, 06 Apr 2016 21:37:22 +0000
Message-ID: <bug-79518-8800-aqg9yDImFy@http.bugs.freedesktop.org/>
References: <bug-79518-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1190966278=="
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


--===============1190966278==
Content-Type: multipart/alternative; boundary="14599786410.F0C6c558.27986";
 charset="UTF-8"


--14599786410.F0C6c558.27986
Date: Wed, 6 Apr 2016 21:37:21 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=79518

--- Comment #9 from Adam Borowski <kilobyte-b9QjgO8OEXPVItvQsEIGlw@public.gmane.org> ---
Created attachment 122781
  --> https://bugs.freedesktop.org/attachment.cgi?id=122781&action=edit
log with 07 pstate

With the 07 pstate, the lockup was different: chromium worked for a longish
time (instead of causing a crash almost immediately).  When finally the lockup
happened, the machine remained operative (sans display) -- but this might be
randomness inherent in such failures.

I'll try 03.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14599786410.F0C6c558.27986
Date: Wed, 6 Apr 2016 21:37:21 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79518#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau causes lockup and reboot on GT215"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79518">bug 79518</a>
              from <span class="vcard"><a class="email" href="mailto:kilobyte&#64;angband.pl" title="Adam Borowski &lt;kilobyte&#64;angband.pl&gt;"> <span class="fn">Adam Borowski</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=122781" name="attach_122781" title="log with 07 pstate">attachment 122781</a> <a href="attachment.cgi?id=122781&amp;action=edit" title="log with 07 pstate">[details]</a></span>
log with 07 pstate

With the 07 pstate, the lockup was different: chromium worked for a longish
time (instead of causing a crash almost immediately).  When finally the lockup
happened, the machine remained operative (sans display) -- but this might be
randomness inherent in such failures.

I'll try 03.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14599786410.F0C6c558.27986--

--===============1190966278==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1190966278==--
