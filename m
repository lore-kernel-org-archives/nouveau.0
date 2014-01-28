From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68835] [NV04] Script offset calculated incorrectly
 for some BMP 1.x VBIOSes
Date: Tue, 28 Jan 2014 22:23:13 +0000
Message-ID: <bug-68835-8800-aXZaok0cJc@http.bugs.freedesktop.org/>
References: <bug-68835-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1355870500=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68835-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1355870500==
Content-Type: multipart/alternative; boundary="1390947792.7e7AADC11.20634"; charset="us-ascii"


--1390947792.7e7AADC11.20634
Date: Tue, 28 Jan 2014 22:23:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68835

Mauro Molinari <mauromol-IWqWACnzNjyonA0d6jMUrA@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |VERIFIED

--- Comment #15 from Mauro Molinari <mauromol-IWqWACnzNjyonA0d6jMUrA@public.gmane.org> ---
Hi Ilia,
good news! After almost two days of hard work, the kernel compilation ended
with success! With the new patched kernel, I don't find "unknown opcode 0x43"
anymore in dmesg output (I'm going to attach it). Suspend and resume work ok!

So, I think this is definitely fixed! Thank you!

Unfortunately, the PROTECTION_ERRORs are still there (bug #68854). I'm also
going to open a new bug for the resolution issue.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390947792.7e7AADC11.20634
Date: Tue, 28 Jan 2014 22:23:12 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:mauromol&#64;tiscali.it" title="Mauro Molinari &lt;mauromol&#64;tiscali.it&gt;"> <span class="fn">Mauro Molinari</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_VERIFIED  bz_closed"
   title="VERIFIED FIXED - [NV04] Script offset calculated incorrectly for some BMP 1.x VBIOSes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68835">bug 68835</a>
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
   title="VERIFIED FIXED - [NV04] Script offset calculated incorrectly for some BMP 1.x VBIOSes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68835#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_VERIFIED  bz_closed"
   title="VERIFIED FIXED - [NV04] Script offset calculated incorrectly for some BMP 1.x VBIOSes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68835">bug 68835</a>
              from <span class="vcard"><a class="email" href="mailto:mauromol&#64;tiscali.it" title="Mauro Molinari &lt;mauromol&#64;tiscali.it&gt;"> <span class="fn">Mauro Molinari</span></a>
</span></b>
        <pre>Hi Ilia,
good news! After almost two days of hard work, the kernel compilation ended
with success! With the new patched kernel, I don't find &quot;unknown opcode 0x43&quot;
anymore in dmesg output (I'm going to attach it). Suspend and resume work ok!

So, I think this is definitely fixed! Thank you!

Unfortunately, the PROTECTION_ERRORs are still there (<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV04] PROTECTION_ERROR / PROTECTION_FAULT"
   href="show_bug.cgi?id=68854">bug #68854</a>). I'm also
going to open a new bug for the resolution issue.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390947792.7e7AADC11.20634--

--===============1355870500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1355870500==--
