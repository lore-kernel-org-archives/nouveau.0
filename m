From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56615] [NVD9] Unable to start X on ThinkPad T420s
	laptop
Date: Sat, 18 Jul 2015 08:55:17 +0000
Message-ID: <bug-56615-8800-hrpwLt9Q2F@http.bugs.freedesktop.org/>
References: <bug-56615-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0369057370=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56615-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0369057370==
Content-Type: multipart/alternative; boundary="1437209717.ad24B1A31.18099"; charset="UTF-8"


--1437209717.ad24B1A31.18099
Date: Sat, 18 Jul 2015 08:55:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56615

--- Comment #30 from Mark Cave-Ayland <mark.cave-ayland-r2/yp8inhXLQXOPxS62xeg@public.gmane.org> ---
Updated dmesg logs have been added - it seems that newer kernels have much more
debugging information included.

The parts of the dmesg log that stand out to me are:

nouveau  [   PDISP][0000:01:00.0] unknown intr24 0x80000000

and:

nouveau E[   PDISP][0000:01:00.0] chid 1 mthd 0x0080 data 0x00000000 0x00005080
0x0000000d

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1437209717.ad24B1A31.18099
Date: Sat, 18 Jul 2015 08:55:17 +0000
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
   title="NEW - [NVD9] Unable to start X on ThinkPad T420s laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56615#c30">Comment # 30</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVD9] Unable to start X on ThinkPad T420s laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56615">bug 56615</a>
              from <span class="vcard"><a class="email" href="mailto:mark.cave-ayland&#64;ilande.co.uk" title="Mark Cave-Ayland &lt;mark.cave-ayland&#64;ilande.co.uk&gt;"> <span class="fn">Mark Cave-Ayland</span></a>
</span></b>
        <pre>Updated dmesg logs have been added - it seems that newer kernels have much more
debugging information included.

The parts of the dmesg log that stand out to me are:

nouveau  [   PDISP][0000:01:00.0] unknown intr24 0x80000000

and:

nouveau E[   PDISP][0000:01:00.0] chid 1 mthd 0x0080 data 0x00000000 0x00005080
0x0000000d</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1437209717.ad24B1A31.18099--

--===============0369057370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0369057370==--
