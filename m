From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86935] [NV106] unknown kepler chipset 0x106
Date: Tue, 02 Dec 2014 15:43:41 +0000
Message-ID: <bug-86935-8800-tzQ1ke9X38@http.bugs.freedesktop.org/>
References: <bug-86935-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2118484769=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86935-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2118484769==
Content-Type: multipart/alternative; boundary="1417535021.4745a81.16320"; charset="UTF-8"


--1417535021.4745a81.16320
Date: Tue, 2 Dec 2014 15:43:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86935

--- Comment #2 from Sven <sven.koehler-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 110361
  --> https://bugs.freedesktop.org/attachment.cgi?id=110361&action=edit
the patch proposed in the previous comment

Adding 0x106 seems to have worked. I can now boot with nouveau framebuffer and
nouveau Xorg driver also works.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1417535021.4745a81.16320
Date: Tue, 2 Dec 2014 15:43:41 +0000
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
   title="NEW - [NV106] unknown kepler chipset 0x106"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86935#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV106] unknown kepler chipset 0x106"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86935">bug 86935</a>
              from <span class="vcard"><a class="email" href="mailto:sven.koehler&#64;gmail.com" title="Sven &lt;sven.koehler&#64;gmail.com&gt;"> <span class="fn">Sven</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=110361" name="attach_110361" title="the patch proposed in the previous comment">attachment 110361</a> <a href="attachment.cgi?id=110361&amp;action=edit" title="the patch proposed in the previous comment">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=86935&amp;attachment=110361'>[review]</a>
the patch proposed in the previous comment

Adding 0x106 seems to have worked. I can now boot with nouveau framebuffer and
nouveau Xorg driver also works.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1417535021.4745a81.16320--

--===============2118484769==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2118484769==--
