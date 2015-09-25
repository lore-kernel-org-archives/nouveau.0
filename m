From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91722] [NVE4] PGRAPH - grctx template channel unload
 timeout, failed to construct context, init failed, -16
Date: Fri, 25 Sep 2015 02:03:06 +0000
Message-ID: <bug-91722-8800-bsQVBjPkAO@http.bugs.freedesktop.org/>
References: <bug-91722-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0416206305=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91722-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0416206305==
Content-Type: multipart/alternative; boundary="1443146586.dE1e0.13950"; charset="UTF-8"


--1443146586.dE1e0.13950
Date: Fri, 25 Sep 2015 02:03:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91722

Steve <stevewilliams-CkBdp7X+a1oIQCUVoCVjmQ@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |stevewilliams-CkBdp7X+a1rUw41kMdicEg@public.gmane.org
                   |                            |net

--- Comment #19 from Steve <stevewilliams-CkBdp7X+a1oIQCUVoCVjmQ@public.gmane.org> ---
Created attachment 118437
  --> https://bugs.freedesktop.org/attachment.cgi?id=118437&action=edit
journal log -b-1 failed boot

I am the user Adam Williamson is referring to above with the Toshiba w50
Trying Fedora 23 beta with all installed updates.

I tried with kernel options:

noveau.config=War00c800_0=1

and:

noveau.config=War00c800_0=1 nouveau.runpm=0

It still fails to boot.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1443146586.dE1e0.13950
Date: Fri, 25 Sep 2015 02:03:06 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:stevewilliams&#64;internode.on.net" title="Steve &lt;stevewilliams&#64;internode.on.net&gt;"> <span class="fn">Steve</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] PGRAPH - grctx template channel unload timeout, failed to construct context, init failed, -16"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91722">bug 91722</a>
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
           <td>stevewilliams&#64;internode.on.net
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] PGRAPH - grctx template channel unload timeout, failed to construct context, init failed, -16"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91722#c19">Comment # 19</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] PGRAPH - grctx template channel unload timeout, failed to construct context, init failed, -16"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91722">bug 91722</a>
              from <span class="vcard"><a class="email" href="mailto:stevewilliams&#64;internode.on.net" title="Steve &lt;stevewilliams&#64;internode.on.net&gt;"> <span class="fn">Steve</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=118437" name="attach_118437" title="journal log -b-1 failed boot">attachment 118437</a> <a href="attachment.cgi?id=118437&amp;action=edit" title="journal log -b-1 failed boot">[details]</a></span>
journal log -b-1 failed boot

I am the user Adam Williamson is referring to above with the Toshiba w50
Trying Fedora 23 beta with all installed updates.

I tried with kernel options:

noveau.config=War00c800_0=1

and:

noveau.config=War00c800_0=1 nouveau.runpm=0

It still fails to boot.</pre>
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

--1443146586.dE1e0.13950--

--===============0416206305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0416206305==--
