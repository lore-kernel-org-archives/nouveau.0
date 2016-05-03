From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93887] [NV96] Amilo Xi 3650: G96M [GeForce 9600M
 GT]: HDMI monitor stays black after s2ram
Date: Tue, 03 May 2016 16:28:52 +0000
Message-ID: <bug-93887-8800-phy9TNff6u@http.bugs.freedesktop.org/>
References: <bug-93887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0109271116=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93887-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0109271116==
Content-Type: multipart/alternative; boundary="14622929321.f52F.5513";
 charset="UTF-8"


--14622929321.f52F.5513
Date: Tue, 3 May 2016 16:28:52 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93887

Elmar Stellnberger <estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #122037|0                           |1
        is obsolete|                            |
 Attachment #122038|0                           |1
        is obsolete|                            |
 Attachment #122041|0                           |1
        is obsolete|                            |
 Attachment #123007|0                           |1
        is obsolete|                            |

--- Comment #26 from Elmar Stellnberger <estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org> ---
Created attachment 123440
  --> https://bugs.freedesktop.org/attachment.cgi?id=123440&action=edit
dmesg with 4.6.0-rc6-ARCH-00006-g7d92f59 and nv84_xuc00f

nouveau/nv84_xuc00f is now installed but it does not make any real difference
for suspending. The screen still falls black and nouveau still reports some
MMIO read/write faults.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14622929321.f52F.5513
Date: Tue, 3 May 2016 16:28:52 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:estellnb&#64;elstel.org" title="Elmar Stellnberger &lt;estellnb&#64;elstel.org&gt;"> <span class="fn">Elmar Stellnberger</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV96] Amilo Xi 3650: G96M [GeForce 9600M GT]: HDMI monitor stays black after s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93887">bug 93887</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Attachment #122037 is obsolete</td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Attachment #122038 is obsolete</td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Attachment #122041 is obsolete</td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Attachment #123007 is obsolete</td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV96] Amilo Xi 3650: G96M [GeForce 9600M GT]: HDMI monitor stays black after s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93887#c26">Comment # 26</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV96] Amilo Xi 3650: G96M [GeForce 9600M GT]: HDMI monitor stays black after s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93887">bug 93887</a>
              from <span class="vcard"><a class="email" href="mailto:estellnb&#64;elstel.org" title="Elmar Stellnberger &lt;estellnb&#64;elstel.org&gt;"> <span class="fn">Elmar Stellnberger</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=123440" name="attach_123440" title="dmesg with 4.6.0-rc6-ARCH-00006-g7d92f59 and nv84_xuc00f">attachment 123440</a> <a href="attachment.cgi?id=123440&amp;action=edit" title="dmesg with 4.6.0-rc6-ARCH-00006-g7d92f59 and nv84_xuc00f">[details]</a></span>
dmesg with 4.6.0-rc6-ARCH-00006-g7d92f59 and nv84_xuc00f

nouveau/nv84_xuc00f is now installed but it does not make any real difference
for suspending. The screen still falls black and nouveau still reports some
MMIO read/write faults.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14622929321.f52F.5513--

--===============0109271116==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0109271116==--
