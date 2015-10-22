From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89664] Nouveau fails to enter KMS with the Gigabyte
 G1 Gaming GTX970
Date: Thu, 22 Oct 2015 21:42:22 +0000
Message-ID: <bug-89664-8800-R1GaNQRL3z@http.bugs.freedesktop.org/>
References: <bug-89664-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2132313629=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89664-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2132313629==
Content-Type: multipart/alternative; boundary="1445550142.DcCcDE1.21469"; charset="UTF-8"


--1445550142.DcCcDE1.21469
Date: Thu, 22 Oct 2015 21:42:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89664

--- Comment #7 from Omar <Omar.networkhosting-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I can safely drop nouveau.config=NvForcePost=1 and KMS works on atleast 1 out
of 2 cards.
I'm also able to run GDM and start a Gnome session on both Xorg and Wayland
(albeit the latter lagging quite badly).

It still has issues with the second card though (which ironically is the first
card when speaking in terms of PCI slots; 01:00.0).
It seems as if that card is still not initialized and the monitors just show a
funky coloured bar made up of small vertical striped (see attachment).

I did a quick grep for nouveau on the boot journal and attached it. If you want
more info I'll be happy to try and provide :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1445550142.DcCcDE1.21469
Date: Thu, 22 Oct 2015 21:42:22 +0000
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
   title="NEW - Nouveau fails to enter KMS with the Gigabyte G1 Gaming GTX970"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89664#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau fails to enter KMS with the Gigabyte G1 Gaming GTX970"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89664">bug 89664</a>
              from <span class="vcard"><a class="email" href="mailto:Omar.networkhosting&#64;gmail.com" title="Omar &lt;Omar.networkhosting&#64;gmail.com&gt;"> <span class="fn">Omar</span></a>
</span></b>
        <pre>I can safely drop nouveau.config=NvForcePost=1 and KMS works on atleast 1 out
of 2 cards.
I'm also able to run GDM and start a Gnome session on both Xorg and Wayland
(albeit the latter lagging quite badly).

It still has issues with the second card though (which ironically is the first
card when speaking in terms of PCI slots; 01:00.0).
It seems as if that card is still not initialized and the monitors just show a
funky coloured bar made up of small vertical striped (see attachment).

I did a quick grep for nouveau on the boot journal and attached it. If you want
more info I'll be happy to try and provide :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445550142.DcCcDE1.21469--

--===============2132313629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2132313629==--
