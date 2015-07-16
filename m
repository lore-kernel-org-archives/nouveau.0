From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91355] [NV108] Quadro K610M: nouveau fills the
 kernel log when a video is played
Date: Thu, 16 Jul 2015 21:52:26 +0000
Message-ID: <bug-91355-8800-OwLlDlNHZO@http.bugs.freedesktop.org/>
References: <bug-91355-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0471238292=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91355-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0471238292==
Content-Type: multipart/alternative; boundary="1437083546.1fA6B6dA1.18943"; charset="UTF-8"


--1437083546.1fA6B6dA1.18943
Date: Thu, 16 Jul 2015 21:52:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91355

Olivier Diotte <vhann3000+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |vhann3000+freedesktop@gmail
                   |                            |.com

--- Comment #4 from Olivier Diotte <vhann3000+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I tested 4.2-rc2 as described here:
https://bugs.launchpad.net/ubuntu/+source/linux-lts-vivid/+bug/1474538/comments/3
. It just locks up instead of filling the partition (which has the same effect
of making the computer unusable :s ).

I am cloning Linus' tree and will test v3.19, v4.0 and v4.1. I'll report with
my findings. Please let me know if I should test other versions or from
nouveau's tree or what not.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1437083546.1fA6B6dA1.18943
Date: Thu, 16 Jul 2015 21:52:26 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:vhann3000+freedesktop&#64;gmail.com" title="Olivier Diotte &lt;vhann3000+freedesktop&#64;gmail.com&gt;"> <span class="fn">Olivier Diotte</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV108] Quadro K610M: nouveau fills the kernel log when a video is played"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91355">bug 91355</a>
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
           <td>vhann3000+freedesktop&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV108] Quadro K610M: nouveau fills the kernel log when a video is played"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91355#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV108] Quadro K610M: nouveau fills the kernel log when a video is played"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91355">bug 91355</a>
              from <span class="vcard"><a class="email" href="mailto:vhann3000+freedesktop&#64;gmail.com" title="Olivier Diotte &lt;vhann3000+freedesktop&#64;gmail.com&gt;"> <span class="fn">Olivier Diotte</span></a>
</span></b>
        <pre>I tested 4.2-rc2 as described here:
<a href="https://bugs.launchpad.net/ubuntu/+source/linux-lts-vivid/+bug/1474538/comments/3">https://bugs.launchpad.net/ubuntu/+source/linux-lts-vivid/+bug/1474538/comments/3</a>
. It just locks up instead of filling the partition (which has the same effect
of making the computer unusable :s ).

I am cloning Linus' tree and will test v3.19, v4.0 and v4.1. I'll report with
my findings. Please let me know if I should test other versions or from
nouveau's tree or what not.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1437083546.1fA6B6dA1.18943--

--===============0471238292==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0471238292==--
