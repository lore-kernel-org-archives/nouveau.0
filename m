From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71662] [nvd9 regression] 3d application hang
Date: Sat, 16 Nov 2013 03:33:52 +0000
Message-ID: <bug-71662-8800-ACYslSOQRh@http.bugs.freedesktop.org/>
References: <bug-71662-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0597640420=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71662-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0597640420==
Content-Type: multipart/alternative; boundary="1384572831.6dB080.9685"; charset="us-ascii"


--1384572831.6dB080.9685
Date: Sat, 16 Nov 2013 03:33:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71662

--- Comment #5 from Jan Vesely <jano.vesely-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
If oa does not hang, I also see a lot of:

[  683.090527] dmar: DRHD: handling fault status reg 3
[  683.090531] dmar: DMAR:[DMA Write] Request device [01:00.0] fault addr
fe000000 
DMAR:[fault reason 05] PTE Write access is not set

There's 1400+ entries in generally ascending order (sometimes it goes back or
stays on the same address). The last one is:

[  683.093190] dmar: DRHD: handling fault status reg 3
[  683.093192] dmar: DMAR:[DMA Write] Request device [01:00.0] fault addr
fe579000 
DMAR:[fault reason 05] PTE Write access is not set

I'm not sure if it's a direct correlation (hang xor dma errors)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384572831.6dB080.9685
Date: Sat, 16 Nov 2013 03:33:51 +0000
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
   title="NEW --- - [nvd9 regression] 3d application hang"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71662#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nvd9 regression] 3d application hang"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71662">bug 71662</a>
              from <span class="vcard"><a class="email" href="mailto:jano.vesely&#64;gmail.com" title="Jan Vesely &lt;jano.vesely&#64;gmail.com&gt;"> <span class="fn">Jan Vesely</span></a>
</span></b>
        <pre>If oa does not hang, I also see a lot of:

[  683.090527] dmar: DRHD: handling fault status reg 3
[  683.090531] dmar: DMAR:[DMA Write] Request device [01:00.0] fault addr
fe000000 
DMAR:[fault reason 05] PTE Write access is not set

There's 1400+ entries in generally ascending order (sometimes it goes back or
stays on the same address). The last one is:

[  683.093190] dmar: DRHD: handling fault status reg 3
[  683.093192] dmar: DMAR:[DMA Write] Request device [01:00.0] fault addr
fe579000 
DMAR:[fault reason 05] PTE Write access is not set

I'm not sure if it's a direct correlation (hang xor dma errors)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1384572831.6dB080.9685--

--===============0597640420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0597640420==--
