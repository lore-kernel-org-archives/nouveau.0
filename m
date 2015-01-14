From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88415] [NVA8] nouveau GPU lockup when reclocking
Date: Wed, 14 Jan 2015 18:18:42 +0000
Message-ID: <bug-88415-8800-prIOmaqf7f@http.bugs.freedesktop.org/>
References: <bug-88415-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0586929036=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88415-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0586929036==
Content-Type: multipart/alternative; boundary="1421259522.E8BE5a1.30017"; charset="UTF-8"


--1421259522.E8BE5a1.30017
Date: Wed, 14 Jan 2015 18:18:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88415

--- Comment #4 from Benedikt Morbach <benedikt.morbach-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> ---
Created attachment 112242
  --> https://bugs.freedesktop.org/attachment.cgi?id=112242&action=edit
dmesg of second try

I just tried again and this time I could reclock between 03 and 07 while X was
running, albeit with quite some errors in dmesg.

But when I tried to go to 0f, I got a lockup again. (also some minor
corruption).
I used sysrq again to get out and dump dmesg. (see attachment)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1421259522.E8BE5a1.30017
Date: Wed, 14 Jan 2015 18:18:42 +0000
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
   title="NEW - [NVA8] nouveau GPU lockup when reclocking"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88415#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVA8] nouveau GPU lockup when reclocking"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88415">bug 88415</a>
              from <span class="vcard"><a class="email" href="mailto:benedikt.morbach&#64;googlemail.com" title="Benedikt Morbach &lt;benedikt.morbach&#64;googlemail.com&gt;"> <span class="fn">Benedikt Morbach</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=112242" name="attach_112242" title="dmesg of second try">attachment 112242</a> <a href="attachment.cgi?id=112242&amp;action=edit" title="dmesg of second try">[details]</a></span>
dmesg of second try

I just tried again and this time I could reclock between 03 and 07 while X was
running, albeit with quite some errors in dmesg.

But when I tried to go to 0f, I got a lockup again. (also some minor
corruption).
I used sysrq again to get out and dump dmesg. (see attachment)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1421259522.E8BE5a1.30017--

--===============0586929036==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0586929036==--
