From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69083] [NV84] specifying higher than EDID-preferred
 4:3 mode on DVI-I -> VGA adapter causes output to be compressed into small
 fraction of CRT's top scan lines
Date: Sat, 07 Nov 2015 20:53:44 +0000
Message-ID: <bug-69083-8800-jhV674nHNo@http.bugs.freedesktop.org/>
References: <bug-69083-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0083072320=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69083-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0083072320==
Content-Type: multipart/alternative; boundary="1446929624.32eF1.7357"; charset="UTF-8"


--1446929624.32eF1.7357
Date: Sat, 7 Nov 2015 20:53:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69083

Felix Miata <mrmazda-ihVZJaRskl1bRRN4PJnoQQ@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WORKSFORME

--- Comment #8 from Felix Miata <mrmazda-ihVZJaRskl1bRRN4PJnoQQ@public.gmane.org> ---
The NEC FE2111SB of comment 0 is no longer available. With a Sony Trinitron
G520 this is not reproducible with any kernel/server/nouveau combination tried,
including k3.7.10/s1.13.2/n1.0.6, k3.11.10/s1.14.3/n1.0.9,
k3.16.7/s1.16.1/n1.0.11 and k4.2.3/s1.17.2/n1.0.11 among others, all using the
same G84 and 32 bit Prescott host. So I'm of the opinion this was more likely a
CRT quirk than a nouveau bug.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1446929624.32eF1.7357
Date: Sat, 7 Nov 2015 20:53:44 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:mrmazda&#64;earthlink.net" title="Felix Miata &lt;mrmazda&#64;earthlink.net&gt;"> <span class="fn">Felix Miata</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED WORKSFORME - [NV84] specifying higher than EDID-preferred 4:3 mode on DVI-I -&gt; VGA adapter causes output to be compressed into small fraction of CRT's top scan lines"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69083">bug 69083</a>
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
           <td>WORKSFORME
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED WORKSFORME - [NV84] specifying higher than EDID-preferred 4:3 mode on DVI-I -&gt; VGA adapter causes output to be compressed into small fraction of CRT's top scan lines"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69083#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED WORKSFORME - [NV84] specifying higher than EDID-preferred 4:3 mode on DVI-I -&gt; VGA adapter causes output to be compressed into small fraction of CRT's top scan lines"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69083">bug 69083</a>
              from <span class="vcard"><a class="email" href="mailto:mrmazda&#64;earthlink.net" title="Felix Miata &lt;mrmazda&#64;earthlink.net&gt;"> <span class="fn">Felix Miata</span></a>
</span></b>
        <pre>The NEC FE2111SB of <a href="show_bug.cgi?id=69083#c0">comment 0</a> is no longer available. With a Sony Trinitron
G520 this is not reproducible with any kernel/server/nouveau combination tried,
including k3.7.10/s1.13.2/n1.0.6, k3.11.10/s1.14.3/n1.0.9,
k3.16.7/s1.16.1/n1.0.11 and k4.2.3/s1.17.2/n1.0.11 among others, all using the
same G84 and 32 bit Prescott host. So I'm of the opinion this was more likely a
CRT quirk than a nouveau bug.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1446929624.32eF1.7357--

--===============0083072320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0083072320==--
