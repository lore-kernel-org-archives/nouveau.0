From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94728] Nouveau doesn't work with Nvidia GTX 960
Date: Mon, 28 Mar 2016 10:12:08 +0000
Message-ID: <bug-94728-8800-cIyP9HCJkw@http.bugs.freedesktop.org/>
References: <bug-94728-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0153201117=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94728-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0153201117==
Content-Type: multipart/alternative; boundary="14591599282.91CaD1B.31544";
 charset="UTF-8"


--14591599282.91CaD1B.31544
Date: Mon, 28 Mar 2016 10:12:08 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94728

Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |NOTABUG

--- Comment #2 from Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> ---
Yes, you need a more up-to-date kernel and mesa version. That is to say Linux
4.6 and mesa 11.2 which are not released yet. You will also need to update
linux-firmware.

Maybe rawhide would work for you?

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14591599282.91CaD1B.31544
Date: Mon, 28 Mar 2016 10:12:08 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:martin.peres&#64;free.fr" title="Martin Peres &lt;martin.peres&#64;free.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - Nouveau doesn't work with Nvidia GTX 960"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94728">bug 94728</a>
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
           <td>NOTABUG
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - Nouveau doesn't work with Nvidia GTX 960"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94728#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - Nouveau doesn't work with Nvidia GTX 960"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94728">bug 94728</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;free.fr" title="Martin Peres &lt;martin.peres&#64;free.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>Yes, you need a more up-to-date kernel and mesa version. That is to say Linux
4.6 and mesa 11.2 which are not released yet. You will also need to update
linux-firmware.

Maybe rawhide would work for you?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14591599282.91CaD1B.31544--

--===============0153201117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0153201117==--
