From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92863] Complete freeze even with NvGrUseFW=1
Date: Sun, 08 Nov 2015 22:11:20 +0000
Message-ID: <bug-92863-8800-YH6inFZ04Z@http.bugs.freedesktop.org/>
References: <bug-92863-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1181955000=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92863-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1181955000==
Content-Type: multipart/alternative; boundary="1447020680.21dB7E1d1.26575"; charset="UTF-8"


--1447020680.21dB7E1d1.26575
Date: Sun, 8 Nov 2015 22:11:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92863

--- Comment #2 from xenith-bjxz+0elTSj2eFz/2MeuCQ@public.gmane.org ---
To reduce some ambiguity, I was running KDE Plasma 5 on Fedora 23 at the time,
browsing github. Firefox acceleration (OMTC) has been turned off. 

All peripherals are dead, but I was able to SSH in, which is how I acquired the
above information. 

Interestingly, you can stop sddm / kill x, and the screen will go blank after a
few minutes (about 5), but if you startx again (or sddm) the displays shows
what was last shown (i.e. exactly where it locked up, the same image before it
blanked.) The screen doesn't blank without killing anything, though.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1447020680.21dB7E1d1.26575
Date: Sun, 8 Nov 2015 22:11:20 +0000
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
   title="NEW - Complete freeze even with NvGrUseFW=1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92863#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Complete freeze even with NvGrUseFW=1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92863">bug 92863</a>
              from <span class="vcard"><a class="email" href="mailto:xenith&#64;overtmind.com" title="xenith&#64;overtmind.com">xenith&#64;overtmind.com</a>
</span></b>
        <pre>To reduce some ambiguity, I was running KDE Plasma 5 on Fedora 23 at the time,
browsing github. Firefox acceleration (OMTC) has been turned off. 

All peripherals are dead, but I was able to SSH in, which is how I acquired the
above information. 

Interestingly, you can stop sddm / kill x, and the screen will go blank after a
few minutes (about 5), but if you startx again (or sddm) the displays shows
what was last shown (i.e. exactly where it locked up, the same image before it
blanked.) The screen doesn't blank without killing anything, though.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1447020680.21dB7E1d1.26575--

--===============1181955000==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1181955000==--
