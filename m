From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90569] [NV67] GUI freezes after startup of Ubuntu
 15.04. on Aspire 7520p [BUG: unable to handle kernel paging request at
 f84c8000]
Date: Thu, 21 May 2015 21:58:01 +0000
Message-ID: <bug-90569-8800-lRj3f3xThR@http.bugs.freedesktop.org/>
References: <bug-90569-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0891804617=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90569-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0891804617==
Content-Type: multipart/alternative; boundary="1432245480.FD621c281.10202"; charset="UTF-8"


--1432245480.FD621c281.10202
Date: Thu, 21 May 2015 21:58:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90569

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Curious observation:

[   78.633151] BUG: unable to handle kernel paging request at f84c8000
[   78.633265] IP: [<f8fb6be9>] nouveau_bo_wr32+0x29/0x60 [nouveau]
[   78.633430] *pdpt = 0000000001b79001 *pde = 0000000034c88067 *pte =
0000000000000000 

[   50.751850] BUG: unable to handle kernel paging request at f84c8000
[   50.751967] IP: [<f8f51be9>] nouveau_bo_wr32+0x29/0x60 [nouveau]
[   50.752139] *pdpt = 0000000001b79001 *pde = 0000000034c88067 *pte =
0000000000000000 

[   68.844824] BUG: unable to handle kernel paging request at f8598000
[   68.845087] IP: [<f8f17be9>] nouveau_bo_wr32+0x29/0x60 [nouveau]
[   68.845475] *pdpt = 0000000001b79001 *pde = 0000000034c88067 *pte =
0000000000000000 

[  183.768120] BUG: unable to handle kernel paging request at f8498000
[  183.768233] IP: [<f8e91be9>] nouveau_bo_wr32+0x29/0x60 [nouveau]
[  183.768402] *pdpt = 0000000001b79001 *pde = 0000000034c88067 *pte =
0000000000000000 

[  107.772418] BUG: unable to handle kernel paging request at f848d000
[  107.772538] IP: [<f8e4cbe9>] nouveau_bo_wr32+0x29/0x60 [nouveau]
[  107.772718] *pdpt = 0000000001b79001 *pde = 0000000034c88067 *pte =
0000000000000000 

The pdpt/pde/pte values are always the same. Perhaps that's just the unmapped
page or something.

Other observations: 32-bit kernel. One instance of a cal_space exhaustion, but
it recovered apparently.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1432245480.FD621c281.10202
Date: Thu, 21 May 2015 21:58:00 +0000
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
   title="NEW - [NV67] GUI freezes after startup of Ubuntu 15.04. on Aspire 7520p [BUG: unable to handle kernel paging request at f84c8000]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90569#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV67] GUI freezes after startup of Ubuntu 15.04. on Aspire 7520p [BUG: unable to handle kernel paging request at f84c8000]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90569">bug 90569</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Curious observation:

[   78.633151] BUG: unable to handle kernel paging request at f84c8000
[   78.633265] IP: [&lt;f8fb6be9&gt;] nouveau_bo_wr32+0x29/0x60 [nouveau]
[   78.633430] *pdpt = 0000000001b79001 *pde = 0000000034c88067 *pte =
0000000000000000 

[   50.751850] BUG: unable to handle kernel paging request at f84c8000
[   50.751967] IP: [&lt;f8f51be9&gt;] nouveau_bo_wr32+0x29/0x60 [nouveau]
[   50.752139] *pdpt = 0000000001b79001 *pde = 0000000034c88067 *pte =
0000000000000000 

[   68.844824] BUG: unable to handle kernel paging request at f8598000
[   68.845087] IP: [&lt;f8f17be9&gt;] nouveau_bo_wr32+0x29/0x60 [nouveau]
[   68.845475] *pdpt = 0000000001b79001 *pde = 0000000034c88067 *pte =
0000000000000000 

[  183.768120] BUG: unable to handle kernel paging request at f8498000
[  183.768233] IP: [&lt;f8e91be9&gt;] nouveau_bo_wr32+0x29/0x60 [nouveau]
[  183.768402] *pdpt = 0000000001b79001 *pde = 0000000034c88067 *pte =
0000000000000000 

[  107.772418] BUG: unable to handle kernel paging request at f848d000
[  107.772538] IP: [&lt;f8e4cbe9&gt;] nouveau_bo_wr32+0x29/0x60 [nouveau]
[  107.772718] *pdpt = 0000000001b79001 *pde = 0000000034c88067 *pte =
0000000000000000 

The pdpt/pde/pte values are always the same. Perhaps that's just the unmapped
page or something.

Other observations: 32-bit kernel. One instance of a cal_space exhaustion, but
it recovered apparently.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1432245480.FD621c281.10202--

--===============0891804617==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0891804617==--
