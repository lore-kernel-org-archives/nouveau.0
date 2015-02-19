From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68488] [NV86] Lockup and reboot on T61 with nouveau
	driver/exa
Date: Thu, 19 Feb 2015 10:01:00 +0000
Message-ID: <bug-68488-8800-LMbv3U804L@http.bugs.freedesktop.org/>
References: <bug-68488-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1816659770=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68488-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1816659770==
Content-Type: multipart/alternative; boundary="1424340060.7BDECBf4.31264"; charset="UTF-8"


--1424340060.7BDECBf4.31264
Date: Thu, 19 Feb 2015 10:01:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68488

Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Depends on|                            |89186

--- Comment #8 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
This bug likely evolved into bug #89186 - same card but newer kernel version.
Let's solve the new one first as it occurs earlier, and check afterwards if
this one is still a problem or not.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1424340060.7BDECBf4.31264
Date: Thu, 19 Feb 2015 10:01:00 +0000
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
   title="NEW - [NV86] Lockup and reboot on T61 with nouveau driver/exa"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68488">bug 68488</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Depends on</td>
           <td>
               &nbsp;
           </td>
           <td>89186
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV86] Lockup and reboot on T61 with nouveau driver/exa"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68488#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV86] Lockup and reboot on T61 with nouveau driver/exa"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68488">bug 68488</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>This bug likely evolved into <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [G86] Artifacts after waking up from suspend"
   href="show_bug.cgi?id=89186">bug #89186</a> - same card but newer kernel version.
Let's solve the new one first as it occurs earlier, and check afterwards if
this one is still a problem or not.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1424340060.7BDECBf4.31264--

--===============1816659770==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1816659770==--
