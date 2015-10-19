From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82835] [NV92] GeForce 8800 GS VDPAU h264 decoding
	hang
Date: Mon, 19 Oct 2015 14:56:05 +0000
Message-ID: <bug-82835-8800-O2NLohQWGP@http.bugs.freedesktop.org/>
References: <bug-82835-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1289429418=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82835-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1289429418==
Content-Type: multipart/alternative; boundary="1445266565.2BbB72814.27896"; charset="UTF-8"


--1445266565.2BbB72814.27896
Date: Mon, 19 Oct 2015 14:56:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82835

--- Comment #20 from Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org> ---
Created attachment 118979
  --> https://bugs.freedesktop.org/attachment.cgi?id=118979&action=edit
hwtest stdout log

So, I tried hwtest from envytools (commit
9c8978886d8c9e57ec7e8c167a7b6aa7ab35dc40), of course without nouveau kernel
module loaded, as root. Looks like vp2 test failed?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1445266565.2BbB72814.27896
Date: Mon, 19 Oct 2015 14:56:05 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO - [NV92] GeForce 8800 GS VDPAU h264 decoding hang"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82835#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO - [NV92] GeForce 8800 GS VDPAU h264 decoding hang"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82835">bug 82835</a>
              from <span class="vcard"><a class="email" href="mailto:randrik&#64;mail.ru" title="Andrew Randrianasulu &lt;randrik&#64;mail.ru&gt;"> <span class="fn">Andrew Randrianasulu</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=118979" name="attach_118979" title="hwtest stdout log">attachment 118979</a> <a href="attachment.cgi?id=118979&amp;action=edit" title="hwtest stdout log">[details]</a></span>
hwtest stdout log

So, I tried hwtest from envytools (commit
9c8978886d8c9e57ec7e8c167a7b6aa7ab35dc40), of course without nouveau kernel
module loaded, as root. Looks like vp2 test failed?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445266565.2BbB72814.27896--

--===============1289429418==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1289429418==--
