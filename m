From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90932] gm107 font glitches with kernel 4.1rc
Date: Tue, 30 Jun 2015 08:05:08 +0000
Message-ID: <bug-90932-8800-teEUYxBjjZ@http.bugs.freedesktop.org/>
References: <bug-90932-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0064073064=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90932-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0064073064==
Content-Type: multipart/alternative; boundary="1435651508.EC5cD61.20188"; charset="UTF-8"


--1435651508.EC5cD61.20188
Date: Tue, 30 Jun 2015 08:05:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90932

--- Comment #16 from Marcus Moeller <marcus.moeller-OI3hZJvNYWs@public.gmane.org> ---
This happened after scrolling through the page buffer in gnome terminal using
Shift+PgUP.

I have also re-checked 4.1 final without latest Xorg updates and modesetting
driver and can confirm that the font glitches are also there. llvmpipe is not
used in this case (only when nomodeset is active/vesa is used).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1435651508.EC5cD61.20188
Date: Tue, 30 Jun 2015 08:05:08 +0000
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
   title="NEW - gm107 font glitches with kernel 4.1rc"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90932#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - gm107 font glitches with kernel 4.1rc"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90932">bug 90932</a>
              from <span class="vcard"><a class="email" href="mailto:marcus.moeller&#64;gmx.ch" title="Marcus Moeller &lt;marcus.moeller&#64;gmx.ch&gt;"> <span class="fn">Marcus Moeller</span></a>
</span></b>
        <pre>This happened after scrolling through the page buffer in gnome terminal using
Shift+PgUP.

I have also re-checked 4.1 final without latest Xorg updates and modesetting
driver and can confirm that the font glitches are also there. llvmpipe is not
used in this case (only when nomodeset is active/vesa is used).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1435651508.EC5cD61.20188--

--===============0064073064==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0064073064==--
