From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93629] [NVE6] complete system freeze,
 PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]
Date: Tue, 05 Apr 2016 13:14:21 +0000
Message-ID: <bug-93629-8800-vaRXjWY1nf@http.bugs.freedesktop.org/>
References: <bug-93629-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0184147204=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93629-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0184147204==
Content-Type: multipart/alternative; boundary="14598620612.Be30e06.1276";
 charset="UTF-8"


--14598620612.Be30e06.1276
Date: Tue, 5 Apr 2016 13:14:21 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93629

--- Comment #14 from Cedric Brandenbourger <cedric-qhlb1eHUncGdZSis0rhKc4dd74u8MsAO@public.gmane.org> ---
Hi i can confirm the problems with the GTX660 firmware.
I'm using Debian 9.0 Stretch with Kernel 4.4. When using the nouveau firmware i
got random freezes. After installing the nvidia driver, the freezes
disappeared.
I then found this bug report, an the solution with using the nvidia blob
firmware is working like a charm

Cédric

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14598620612.Be30e06.1276
Date: Tue, 5 Apr 2016 13:14:21 +0000
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
   title="NEW - [NVE6] complete system freeze, PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93629#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] complete system freeze, PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93629">bug 93629</a>
              from <span class="vcard"><a class="email" href="mailto:cedric&#64;brandenbourger.lu" title="Cedric Brandenbourger &lt;cedric&#64;brandenbourger.lu&gt;"> <span class="fn">Cedric Brandenbourger</span></a>
</span></b>
        <pre>Hi i can confirm the problems with the GTX660 firmware.
I'm using Debian 9.0 Stretch with Kernel 4.4. When using the nouveau firmware i
got random freezes. After installing the nvidia driver, the freezes
disappeared.
I then found this bug report, an the solution with using the nvidia blob
firmware is working like a charm

Cédric</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14598620612.Be30e06.1276--

--===============0184147204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0184147204==--
