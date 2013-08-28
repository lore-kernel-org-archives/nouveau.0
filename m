From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68665] [NVE4] Crashing games when set AA to x2 on
	GTX760
Date: Wed, 28 Aug 2013 14:49:45 +0000
Message-ID: <bug-68665-8800-K8CGYHEdNd@http.bugs.freedesktop.org/>
References: <bug-68665-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1166788161=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68665-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1166788161==
Content-Type: multipart/alternative; boundary="1377701385.2daCd8c1.5659"; charset="us-ascii"


--1377701385.2daCd8c1.5659
Date: Wed, 28 Aug 2013 14:49:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68665

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Crashing games when set AA  |[NVE4] Crashing games when
                   |to x2 on GTX760             |set AA to x2 on GTX760

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
To answer my own question, from the linked bugs, there is:

Aug 27 16:51:15 Elias kernel: [24255.888373] nouveau E[  PGRAPH][0000:01:00.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x000007f73d xonotic-sdl[7519]] subc 1 class
0xa0c0 mthd 0x02f4 data 0x0040aaaa

Unfortunately, Igor, you're not the original reporter of these bugs, as I
understand it. (And more importantly, can't test potential fixes.) Hopefully
someone on the nouveau team has the requisite hardware to be able to test this
out. Given that it's a kepler card, I think it's important to make sure that
the latest git kernel is used, as there are fixes not available in 3.10
regarding context switching and initialization. (Not sure if those are at fault
here, but it's good to get that out of the way.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377701385.2daCd8c1.5659
Date: Wed, 28 Aug 2013 14:49:45 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE4] Crashing games when set AA to x2 on GTX760"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68665">bug 68665</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>Crashing games when set AA to x2 on GTX760
           </td>
           <td>[NVE4] Crashing games when set AA to x2 on GTX760
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE4] Crashing games when set AA to x2 on GTX760"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68665#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE4] Crashing games when set AA to x2 on GTX760"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68665">bug 68665</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>To answer my own question, from the linked bugs, there is:

Aug 27 16:51:15 Elias kernel: [24255.888373] nouveau E[  PGRAPH][0000:01:00.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x000007f73d xonotic-sdl[7519]] subc 1 class
0xa0c0 mthd 0x02f4 data 0x0040aaaa

Unfortunately, Igor, you're not the original reporter of these bugs, as I
understand it. (And more importantly, can't test potential fixes.) Hopefully
someone on the nouveau team has the requisite hardware to be able to test this
out. Given that it's a kepler card, I think it's important to make sure that
the latest git kernel is used, as there are fixes not available in 3.10
regarding context switching and initialization. (Not sure if those are at fault
here, but it's good to get that out of the way.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377701385.2daCd8c1.5659--

--===============1166788161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1166788161==--
