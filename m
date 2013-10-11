From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69928] [NVAA] Boot of linux kernel 3.12-rc2 hangs
Date: Fri, 11 Oct 2013 22:12:13 +0000
Message-ID: <bug-69928-8800-gAwpzi8TTc@http.bugs.freedesktop.org/>
References: <bug-69928-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0400711723=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69928-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0400711723==
Content-Type: multipart/alternative; boundary="1381529533.aD4d2.20992"; charset="us-ascii"


--1381529533.aD4d2.20992
Date: Fri, 11 Oct 2013 22:12:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69928

--- Comment #5 from Dmitry Chichkov <dchichkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Confirmed with 3.12-rc4. 

System:
 ASUS P6T SE, i7
 Nvidia GF100 [GeForce GTX 470] (rev a3).
 Ubuntu 13.04.

Details: No error with 3.10 kernel.   Boots / hangs in the text mode before
unity-greater with 3.12-rc4.     Boots succesfully / works fine with 3.12-rc4
with nouveau.config=NvMSI=0 in the boot command line.


I would suggest rising a priority on this one.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381529533.aD4d2.20992
Date: Fri, 11 Oct 2013 22:12:13 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVAA] Boot of linux kernel 3.12-rc2 hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69928#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVAA] Boot of linux kernel 3.12-rc2 hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69928">bug 69928</a>
              from <span class="vcard"><a class="email" href="mailto:dchichkov&#64;gmail.com" title="Dmitry Chichkov &lt;dchichkov&#64;gmail.com&gt;"> <span class="fn">Dmitry Chichkov</span></a>
</span></b>
        <pre>Confirmed with 3.12-rc4. 

System:
 ASUS P6T SE, i7
 Nvidia GF100 [GeForce GTX 470] (rev a3).
 Ubuntu 13.04.

Details: No error with 3.10 kernel.   Boots / hangs in the text mode before
unity-greater with 3.12-rc4.     Boots succesfully / works fine with 3.12-rc4
with nouveau.config=NvMSI=0 in the boot command line.


I would suggest rising a priority on this one.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381529533.aD4d2.20992--

--===============0400711723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0400711723==--
