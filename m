From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87244] [NV94] X hangs,
 logs show kernel: nouveau E[ PFIFO][0000:01:00.0] still angry after
 101 spins, halt followed by an X trace
Date: Wed, 18 Mar 2015 19:24:57 +0000
Message-ID: <bug-87244-8800-Sp34M96EOo@http.bugs.freedesktop.org/>
References: <bug-87244-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1300507072=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87244-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1300507072==
Content-Type: multipart/alternative; boundary="1426706697.603A83.7679"; charset="UTF-8"


--1426706697.603A83.7679
Date: Wed, 18 Mar 2015 19:24:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87244

aebenjam-gGaKbNYk6w1Wk0Htik3J/w@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |aebenjam-gGaKbNYk6w1Wk0Htik3J/w@public.gmane.org

--- Comment #20 from aebenjam-gGaKbNYk6w1Wk0Htik3J/w@public.gmane.org ---
This sounds horribly familiar.  Seeing the same behaviour after I hit the
3.18.x kernels with Fedora 20.  I'm using a "NVIDIA Corporation G86 [Quadro NVS
290] (rev a1)".  Not sure if the additional card information helps or if the
bug and fix are definitely the one posted.  Here's hoping it's brought into the
mainline kernel soon... (but I will likely try recompiling my own kernel with
the offered patch sometime soon.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1426706697.603A83.7679
Date: Wed, 18 Mar 2015 19:24:57 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:aebenjam&#64;opentext.com" title="aebenjam&#64;opentext.com">aebenjam&#64;opentext.com</a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] X hangs, logs show kernel: nouveau E[ PFIFO][0000:01:00.0] still angry after 101 spins, halt followed by an X trace"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87244">bug 87244</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>aebenjam&#64;opentext.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] X hangs, logs show kernel: nouveau E[ PFIFO][0000:01:00.0] still angry after 101 spins, halt followed by an X trace"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87244#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] X hangs, logs show kernel: nouveau E[ PFIFO][0000:01:00.0] still angry after 101 spins, halt followed by an X trace"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87244">bug 87244</a>
              from <span class="vcard"><a class="email" href="mailto:aebenjam&#64;opentext.com" title="aebenjam&#64;opentext.com">aebenjam&#64;opentext.com</a>
</span></b>
        <pre>This sounds horribly familiar.  Seeing the same behaviour after I hit the
3.18.x kernels with Fedora 20.  I'm using a &quot;NVIDIA Corporation G86 [Quadro NVS
290] (rev a1)&quot;.  Not sure if the additional card information helps or if the
bug and fix are definitely the one posted.  Here's hoping it's brought into the
mainline kernel soon... (but I will likely try recompiling my own kernel with
the offered patch sometime soon.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1426706697.603A83.7679--

--===============1300507072==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1300507072==--
