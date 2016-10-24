From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98398] Acer Aspire V7-582PG (Haswell,
 GTX 750M) fails to power off GPU with runtime PM
Date: Mon, 24 Oct 2016 10:09:46 +0000
Message-ID: <bug-98398-8800-TPhUXflpbC@http.bugs.freedesktop.org/>
References: <bug-98398-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1674574179=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98398-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1674574179==
Content-Type: multipart/alternative; boundary="14773037860.132e.6002";
 charset="UTF-8"


--14773037860.132e.6002
Date: Mon, 24 Oct 2016 10:09:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98398

Peter Wu <peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[Nouveau] Vgaswitcharoo     |Acer Aspire V7-582PG
                   |fails to turn off GPU       |(Haswell, GTX 750M) fails
                   |properly                    |to power off GPU with
                   |                            |runtime PM
                 CC|                            |peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org

--- Comment #8 from Peter Wu <peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org> ---
Pablo, the issues that bbswitch has is different from the one reported here.
bbswitch is not updated for 4.8 requiring the pcie_port_pm=3Doff workaround.

There are more details for this bug from the reporter in IRC (search for
NanoSector):
https://people.freedesktop.org/~cbrill/dri-log/index.php?channel=3Dnouveau&=
date=3D2016-10-22

In particular, Rick reported that the issue apparently also appears with ol=
der
kernels, including 4.3 to 4.8. This is significant and a surprising result
because kernel 4.8 plus pcie_port_pm=3Doff (or the d3cold_allowed change) s=
hould
have the same result as 4.7 or before. Rick, can you re-test it with 4.7?

It also occurs to me that older kernels might not support your GPU, so be s=
ure
to keep a dmesg around.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14773037860.132e.6002
Date: Mon, 24 Oct 2016 10:09:46 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:peter&#64=
;lekensteyn.nl" title=3D"Peter Wu &lt;peter&#64;lekensteyn.nl&gt;"> <span c=
lass=3D"fn">Peter Wu</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Acer Aspire V7-582PG (Haswell, GTX 750M) fails to power o=
ff GPU with runtime PM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98398">bug 98398<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Summary</td>
           <td>[Nouveau] Vgaswitcharoo fails to turn off GPU properly
           </td>
           <td>Acer Aspire V7-582PG (Haswell, GTX 750M) fails to power off =
GPU with runtime PM
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>peter&#64;lekensteyn.nl
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Acer Aspire V7-582PG (Haswell, GTX 750M) fails to power o=
ff GPU with runtime PM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98398#c8">Comment=
 # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Acer Aspire V7-582PG (Haswell, GTX 750M) fails to power o=
ff GPU with runtime PM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98398">bug 98398<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
peter&#64;lekensteyn.nl" title=3D"Peter Wu &lt;peter&#64;lekensteyn.nl&gt;"=
> <span class=3D"fn">Peter Wu</span></a>
</span></b>
        <pre>Pablo, the issues that bbswitch has is different from the one =
reported here.
bbswitch is not updated for 4.8 requiring the pcie_port_pm=3Doff workaround.

There are more details for this bug from the reporter in IRC (search for
NanoSector):
<a href=3D"https://people.freedesktop.org/~cbrill/dri-log/index.php?channel=
=3Dnouveau&amp;date=3D2016-10-22">https://people.freedesktop.org/~cbrill/dr=
i-log/index.php?channel=3Dnouveau&amp;date=3D2016-10-22</a>

In particular, Rick reported that the issue apparently also appears with ol=
der
kernels, including 4.3 to 4.8. This is significant and a surprising result
because kernel 4.8 plus pcie_port_pm=3Doff (or the d3cold_allowed change) s=
hould
have the same result as 4.7 or before. Rick, can you re-test it with 4.7?

It also occurs to me that older kernels might not support your GPU, so be s=
ure
to keep a dmesg around.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14773037860.132e.6002--

--===============1674574179==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1674574179==--
