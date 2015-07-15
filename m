From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72315] Fedora 19 64-bit X crash
Date: Wed, 15 Jul 2015 21:43:48 +0000
Message-ID: <bug-72315-8800-ycscPItpya@http.bugs.freedesktop.org/>
References: <bug-72315-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0244261381=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72315-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0244261381==
Content-Type: multipart/alternative; boundary="1436996628.73FCbCcD2.21996"; charset="UTF-8"


--1436996628.73FCbCcD2.21996
Date: Wed, 15 Jul 2015 21:43:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72315

--- Comment #6 from Richac <cooloutac-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> ---
I had the same exact issue as Mario above me.  

I was unable to wake my monitor from suspend,  I had set a shutdown -P +120
timer.  so I just waited for the pc to shutoff,   the pc didn't crash.  Cause i
could hear the podcast i was listening to in background, and the hdd light was
blinking at its usual interval and the pc shut off at the time it was supposed
to. 

But I got repeatedly a couple dozen times:

nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 4 [0x003f8b9000 compiz[2567]]
nouveau E[  PGRAPH][0000:01:00.0] ROP0 0x80000000 0x80000001
nouveau E[  PGRAPH][0000:01:00.0] ROP1 0x80000000 0x80000001

and the log also ended with about 150,000 lines of these two errors repeating:

nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[1505]] subc 0 mthd 0x001c
data 0x00001004

nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ACQUIRE

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1436996628.73FCbCcD2.21996
Date: Wed, 15 Jul 2015 21:43:48 +0000
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
   title="NEW - Fedora 19 64-bit X crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72315#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Fedora 19 64-bit X crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72315">bug 72315</a>
              from <span class="vcard"><a class="email" href="mailto:cooloutac&#64;yahoo.com" title="Richac &lt;cooloutac&#64;yahoo.com&gt;"> <span class="fn">Richac</span></a>
</span></b>
        <pre>I had the same exact issue as Mario above me.  

I was unable to wake my monitor from suspend,  I had set a shutdown -P +120
timer.  so I just waited for the pc to shutoff,   the pc didn't crash.  Cause i
could hear the podcast i was listening to in background, and the hdd light was
blinking at its usual interval and the pc shut off at the time it was supposed
to. 

But I got repeatedly a couple dozen times:

nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 4 [0x003f8b9000 compiz[2567]]
nouveau E[  PGRAPH][0000:01:00.0] ROP0 0x80000000 0x80000001
nouveau E[  PGRAPH][0000:01:00.0] ROP1 0x80000000 0x80000001

and the log also ended with about 150,000 lines of these two errors repeating:

nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[1505]] subc 0 mthd 0x001c
data 0x00001004

nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ACQUIRE</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1436996628.73FCbCcD2.21996--

--===============0244261381==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0244261381==--
