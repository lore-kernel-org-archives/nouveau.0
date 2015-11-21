From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91738] [NV117] NULL deref in
 nvkm_i2c_try_acquire_pad, kernel 4.1
Date: Sat, 21 Nov 2015 00:23:56 +0000
Message-ID: <bug-91738-8800-JbsiCYSBay@http.bugs.freedesktop.org/>
References: <bug-91738-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0454170804=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91738-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0454170804==
Content-Type: multipart/alternative; boundary="1448065436.e53c1.8476"; charset="UTF-8"


--1448065436.e53c1.8476
Date: Sat, 21 Nov 2015 00:23:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91738

ryanpcmcquen <ryan.q-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |VERIFIED

--- Comment #24 from ryanpcmcquen <ryan.q-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org> ---
I spoke too soon, the issue seems absent with the latest nouveau driver on
Linux 4.2.x+, but still exists on 4.1.x. I now have Xorg 1.18.0 if that makes
any difference.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1448065436.e53c1.8476
Date: Sat, 21 Nov 2015 00:23:56 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:ryan.q&#64;linux.com" title="ryanpcmcquen &lt;ryan.q&#64;linux.com&gt;"> <span class="fn">ryanpcmcquen</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_VERIFIED  bz_closed"
   title="VERIFIED FIXED - [NV117] NULL deref in nvkm_i2c_try_acquire_pad, kernel 4.1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91738">bug 91738</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>VERIFIED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_VERIFIED  bz_closed"
   title="VERIFIED FIXED - [NV117] NULL deref in nvkm_i2c_try_acquire_pad, kernel 4.1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91738#c24">Comment # 24</a>
              on <a class="bz_bug_link 
          bz_status_VERIFIED  bz_closed"
   title="VERIFIED FIXED - [NV117] NULL deref in nvkm_i2c_try_acquire_pad, kernel 4.1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91738">bug 91738</a>
              from <span class="vcard"><a class="email" href="mailto:ryan.q&#64;linux.com" title="ryanpcmcquen &lt;ryan.q&#64;linux.com&gt;"> <span class="fn">ryanpcmcquen</span></a>
</span></b>
        <pre>I spoke too soon, the issue seems absent with the latest nouveau driver on
Linux 4.2.x+, but still exists on 4.1.x. I now have Xorg 1.18.0 if that makes
any difference.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1448065436.e53c1.8476--

--===============0454170804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0454170804==--
