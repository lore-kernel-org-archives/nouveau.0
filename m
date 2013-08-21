From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63101] [NV4B] NVIDIA GeForce 7300 GT AGP graphics
 card will not display any text characters on VIA Technologies Apollo
 MVP3-based mainboard
Date: Wed, 21 Aug 2013 03:53:40 +0000
Message-ID: <bug-63101-8800-sM8vq99GLn@http.bugs.freedesktop.org/>
References: <bug-63101-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1849147623=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-63101-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1849147623==
Content-Type: multipart/alternative; boundary="1377057220.cbf66A3A2.24799"; charset="us-ascii"


--1377057220.cbf66A3A2.24799
Date: Wed, 21 Aug 2013 03:53:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63101

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO
            Summary|[Ubuntu 10.04.4 LTS 32-bit] |[NV4B] NVIDIA GeForce 7300
                   |NVIDIA GeForce 7300 GT AGP  |GT AGP graphics card will
                   |graphics card will not      |not display any text
                   |display any text characters |characters on VIA
                   |on VIA Technologies Apollo  |Technologies Apollo
                   |MVP3-based mainboard        |MVP3-based mainboard

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Can you try this with an upstream kernel, e.g. 3.10 or the kernel at
nouveau/master? (Note that 3.11-rc1 - 3.11-rc6 will crash on load for you, -rc7
should be fine when it comes out.) It's impossible to tell what's in those LTS
kernels, so they're basically useless for reporting bugs to upstream about. If
building your own kernel isn't an option, you should file this but with Ubuntu.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377057220.cbf66A3A2.24799
Date: Wed, 21 Aug 2013 03:53:40 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NV4B] NVIDIA GeForce 7300 GT AGP graphics card will not display any text characters on VIA Technologies Apollo MVP3-based mainboard"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63101">bug 63101</a>
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
           <td>NEEDINFO
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>[Ubuntu 10.04.4 LTS 32-bit] NVIDIA GeForce 7300 GT AGP graphics card will not display any text characters on VIA Technologies Apollo MVP3-based mainboard
           </td>
           <td>[NV4B] NVIDIA GeForce 7300 GT AGP graphics card will not display any text characters on VIA Technologies Apollo MVP3-based mainboard
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NV4B] NVIDIA GeForce 7300 GT AGP graphics card will not display any text characters on VIA Technologies Apollo MVP3-based mainboard"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63101#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NV4B] NVIDIA GeForce 7300 GT AGP graphics card will not display any text characters on VIA Technologies Apollo MVP3-based mainboard"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63101">bug 63101</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Can you try this with an upstream kernel, e.g. 3.10 or the kernel at
nouveau/master? (Note that 3.11-rc1 - 3.11-rc6 will crash on load for you, -rc7
should be fine when it comes out.) It's impossible to tell what's in those LTS
kernels, so they're basically useless for reporting bugs to upstream about. If
building your own kernel isn't an option, you should file this but with Ubuntu.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377057220.cbf66A3A2.24799--

--===============1849147623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1849147623==--
