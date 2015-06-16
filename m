From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90871] NV30: Xfwm4 use_compositing - garbled display
Date: Tue, 16 Jun 2015 19:13:15 +0000
Message-ID: <bug-90871-8800-c3AfpbtSOz@http.bugs.freedesktop.org/>
References: <bug-90871-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1898457577=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90871-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1898457577==
Content-Type: multipart/alternative; boundary="1434481995.C544fD1A0.11291"; charset="UTF-8"


--1434481995.C544fD1A0.11291
Date: Tue, 16 Jun 2015 19:13:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90871

--- Comment #11 from Olivier Fourdan <fourdan-eaOCjQ5FDoY@public.gmane.org> ---
Created attachment 116536
  --> https://bugs.freedesktop.org/attachment.cgi?id=116536&action=edit
test program


Can you try with this test program and see if you can reproduce:

1. Save attachment as tfp-test.c

2. Build with 

  $ gcc -g tfp-test.c -o tfp-test $(pkg-config --cflags --libs epoxy xrender
xfixes xcomposite x11)

3. Run with 

  $ ./tfp-test

4. Use the mouse button to chaneg the Pixmap/texture or press a key to exit.

If you can reproduce then we may have a simple reproducer, that could be
helpful with the investigation.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1434481995.C544fD1A0.11291
Date: Tue, 16 Jun 2015 19:13:15 +0000
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
   title="NEW - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871">bug 90871</a>
              from <span class="vcard"><a class="email" href="mailto:fourdan&#64;xfce.org" title="Olivier Fourdan &lt;fourdan&#64;xfce.org&gt;"> <span class="fn">Olivier Fourdan</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=116536" name="attach_116536" title="test program">attachment 116536</a> <a href="attachment.cgi?id=116536&amp;action=edit" title="test program">[details]</a></span>
test program


Can you try with this test program and see if you can reproduce:

1. Save attachment as tfp-test.c

2. Build with 

  $ gcc -g tfp-test.c -o tfp-test $(pkg-config --cflags --libs epoxy xrender
xfixes xcomposite x11)

3. Run with 

  $ ./tfp-test

4. Use the mouse button to chaneg the Pixmap/texture or press a key to exit.

If you can reproduce then we may have a simple reproducer, that could be
helpful with the investigation.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1434481995.C544fD1A0.11291--

--===============1898457577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1898457577==--
