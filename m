From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88262] [NV28] 3.19 kernels hang during boot
Date: Sat, 10 Jan 2015 09:39:41 +0000
Message-ID: <bug-88262-8800-S5mvHPkZaM@http.bugs.freedesktop.org/>
References: <bug-88262-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1957684010=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88262-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1957684010==
Content-Type: multipart/alternative; boundary="1420882781.1d277b201.13924"; charset="UTF-8"


--1420882781.1d277b201.13924
Date: Sat, 10 Jan 2015 09:39:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88262

Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|3.19 kernels hang during    |[NV28] 3.19 kernels hang
                   |boot for an NV28 based card |during boot

--- Comment #2 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
You could blacklist nouveau (via /etc/modprobe.d/somefile.conf) and load it
manually once you're logged in. It seems you're using netconsole, but it only
gets up once nouveau is loaded (apparently the interface is first called enp5s3
and is renamed to eth0 too late (for us)), so loading nouveau manually should
also help you get some logs via netconsole.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1420882781.1d277b201.13924
Date: Sat, 10 Jan 2015 09:39:41 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV28] 3.19 kernels hang during boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88262">bug 88262</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>3.19 kernels hang during boot for an NV28 based card
           </td>
           <td>[NV28] 3.19 kernels hang during boot
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV28] 3.19 kernels hang during boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88262#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV28] 3.19 kernels hang during boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88262">bug 88262</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>You could blacklist nouveau (via /etc/modprobe.d/somefile.conf) and load it
manually once you're logged in. It seems you're using netconsole, but it only
gets up once nouveau is loaded (apparently the interface is first called enp5s3
and is renamed to eth0 too late (for us)), so loading nouveau manually should
also help you get some logs via netconsole.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1420882781.1d277b201.13924--

--===============1957684010==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1957684010==--
