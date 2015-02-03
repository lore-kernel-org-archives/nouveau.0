From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88946] [NVC1] black screen after resuming from
	hibernate
Date: Tue, 03 Feb 2015 18:07:25 +0000
Message-ID: <bug-88946-8800-jnlTN7EQVl@http.bugs.freedesktop.org/>
References: <bug-88946-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1380901913=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88946-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1380901913==
Content-Type: multipart/alternative; boundary="1422986845.bD5E2.11375"; charset="UTF-8"


--1422986845.bD5E2.11375
Date: Tue, 3 Feb 2015 18:07:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88946

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Looks like on resume you're getting a ton of

[   75.967312] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x610260 [ IBUS ]
[   75.967343] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x610260 [ IBUS ]

followed by

[   75.967345] nouveau E[   PDISP][0000:01:00.0][0xc000857b][ffff8803f3954100]
timeout1: 0x00000000
[   75.967346] nouveau E[   PDISP][0000:01:00.0][0xc000857b][ffff8803f3954100]
init failed, -16

and some other init failures. When the card fails to come up, X isn't
particularly happy about that either, hence the black screen and general state
of sadness. So the question is why does the card not come up properly...

By the way, when you say "standby" I assume you mean "suspend to ram", while
when you say "hibernate", I assume you mean "suspend to disk" right?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1422986845.bD5E2.11375
Date: Tue, 3 Feb 2015 18:07:25 +0000
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
   title="NEW - [NVC1] black screen after resuming from hibernate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88946#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC1] black screen after resuming from hibernate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88946">bug 88946</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Looks like on resume you're getting a ton of

[   75.967312] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x610260 [ IBUS ]
[   75.967343] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x610260 [ IBUS ]

followed by

[   75.967345] nouveau E[   PDISP][0000:01:00.0][0xc000857b][ffff8803f3954100]
timeout1: 0x00000000
[   75.967346] nouveau E[   PDISP][0000:01:00.0][0xc000857b][ffff8803f3954100]
init failed, -16

and some other init failures. When the card fails to come up, X isn't
particularly happy about that either, hence the black screen and general state
of sadness. So the question is why does the card not come up properly...

By the way, when you say &quot;standby&quot; I assume you mean &quot;suspend to ram&quot;, while
when you say &quot;hibernate&quot;, I assume you mean &quot;suspend to disk&quot; right?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1422986845.bD5E2.11375--

--===============1380901913==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1380901913==--
