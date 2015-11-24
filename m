From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92892] [NVA8] KDE Plasma locks up: Nouveau reports
 error "resource sanity check" "unable to handle kernel paging request"
Date: Tue, 24 Nov 2015 16:17:13 +0000
Message-ID: <bug-92892-8800-XB2u9VD5ue@http.bugs.freedesktop.org/>
References: <bug-92892-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0357426067=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92892-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0357426067==
Content-Type: multipart/alternative; boundary="1448381832.4BA405ae1.19102"; charset="UTF-8"


--1448381832.4BA405ae1.19102
Date: Tue, 24 Nov 2015 16:17:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92892

--- Comment #6 from Andreas Nordal <andreas_nordal_4-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> ---
I believe I'm seeing the same bug:
* plasma5 hangs with kernel to 4.3, but not 4.2
* "resource sanity check" in /var/log/messages

I have an "NVIDIA Corporation G98 [Quadro NVS 295] (rev a1)" as seen by lspci
(Dell workstation).

I have kernel-default-4.3.0-2.1 on Tumbleweed, but when I had
kernel-default-4.3.0-1.1, I was also seeing "DRM: GPU lockup - switching to
software fbcon" like in #92971.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1448381832.4BA405ae1.19102
Date: Tue, 24 Nov 2015 16:17:12 +0000
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
   title="NEW - [NVA8] KDE Plasma locks up: Nouveau reports error &quot;resource sanity check&quot; &quot;unable to handle kernel paging request&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92892#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVA8] KDE Plasma locks up: Nouveau reports error &quot;resource sanity check&quot; &quot;unable to handle kernel paging request&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92892">bug 92892</a>
              from <span class="vcard"><a class="email" href="mailto:andreas_nordal_4&#64;hotmail.com" title="Andreas Nordal &lt;andreas_nordal_4&#64;hotmail.com&gt;"> <span class="fn">Andreas Nordal</span></a>
</span></b>
        <pre>I believe I'm seeing the same bug:
* plasma5 hangs with kernel to 4.3, but not 4.2
* &quot;resource sanity check&quot; in /var/log/messages

I have an &quot;NVIDIA Corporation G98 [Quadro NVS 295] (rev a1)&quot; as seen by lspci
(Dell workstation).

I have kernel-default-4.3.0-2.1 on Tumbleweed, but when I had
kernel-default-4.3.0-1.1, I was also seeing &quot;DRM: GPU lockup - switching to
software fbcon&quot; like in #92971.</pre>
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

--1448381832.4BA405ae1.19102--

--===============0357426067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0357426067==--
