From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61765] Regression: null pointer dereference on
 reboot after switcheroo use
Date: Sat, 17 Jan 2015 00:08:09 +0000
Message-ID: <bug-61765-8800-C9Ynvg3S9w@http.bugs.freedesktop.org/>
References: <bug-61765-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1989536601=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61765-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1989536601==
Content-Type: multipart/alternative; boundary="1421453289.6723eF11.15345"; charset="UTF-8"


--1421453289.6723eF11.15345
Date: Sat, 17 Jan 2015 00:08:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61765

Tobias Klausmann <tobias.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO

--- Comment #3 from Tobias Klausmann <tobias.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> ---
still a problem with newer kernels (3.17, 3.18)? there were really many fixes
in between that could fix this...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1421453289.6723eF11.15345
Date: Sat, 17 Jan 2015 00:08:09 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:tobias.klausmann&#64;mni.thm.de" title="Tobias Klausmann &lt;tobias.klausmann&#64;mni.thm.de&gt;"> <span class="fn">Tobias Klausmann</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO - Regression: null pointer dereference on reboot after switcheroo use"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61765">bug 61765</a>
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
           <td>NEEDINFO
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO - Regression: null pointer dereference on reboot after switcheroo use"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61765#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO - Regression: null pointer dereference on reboot after switcheroo use"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61765">bug 61765</a>
              from <span class="vcard"><a class="email" href="mailto:tobias.klausmann&#64;mni.thm.de" title="Tobias Klausmann &lt;tobias.klausmann&#64;mni.thm.de&gt;"> <span class="fn">Tobias Klausmann</span></a>
</span></b>
        <pre>still a problem with newer kernels (3.17, 3.18)? there were really many fixes
in between that could fix this...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1421453289.6723eF11.15345--

--===============1989536601==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1989536601==--
