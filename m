From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91445] Thick black borders around windows with Ubuntu
Date: Fri, 24 Jul 2015 07:25:57 +0000
Message-ID: <bug-91445-8800-XUU4QNVo08@http.bugs.freedesktop.org/>
References: <bug-91445-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1219296825=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91445-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1219296825==
Content-Type: multipart/alternative; boundary="1437722757.54E3B3DC0.32133"; charset="UTF-8"


--1437722757.54E3B3DC0.32133
Date: Fri, 24 Jul 2015 07:25:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91445

Mauro Rossi <issor.oruam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |NOTOURBUG

--- Comment #6 from Mauro Rossi <issor.oruam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi,

I've checked with both xorg-edgers and oibaf PPA drivers
and forcing the stable version of xserver-xorg-video-nouveau is solving the
black borders problem.

[on Ununtu 15.04]
sudo apt-get install xserver-xorg-video-nouveau=1:1.0.11-1ubuntu2build1


Thanks a lot, these xorg artifacts were bugging me since weeks
Mauro

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1437722757.54E3B3DC0.32133
Date: Fri, 24 Jul 2015 07:25:57 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:issor.oruam&#64;gmail.com" title="Mauro Rossi &lt;issor.oruam&#64;gmail.com&gt;"> <span class="fn">Mauro Rossi</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTOURBUG - Thick black borders around windows with Ubuntu"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91445">bug 91445</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>NOTOURBUG
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTOURBUG - Thick black borders around windows with Ubuntu"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91445#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTOURBUG - Thick black borders around windows with Ubuntu"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91445">bug 91445</a>
              from <span class="vcard"><a class="email" href="mailto:issor.oruam&#64;gmail.com" title="Mauro Rossi &lt;issor.oruam&#64;gmail.com&gt;"> <span class="fn">Mauro Rossi</span></a>
</span></b>
        <pre>Hi,

I've checked with both xorg-edgers and oibaf PPA drivers
and forcing the stable version of xserver-xorg-video-nouveau is solving the
black borders problem.

[on Ununtu 15.04]
sudo apt-get install xserver-xorg-video-nouveau=1:1.0.11-1ubuntu2build1


Thanks a lot, these xorg artifacts were bugging me since weeks
Mauro</pre>
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

--1437722757.54E3B3DC0.32133--

--===============1219296825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1219296825==--
