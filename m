From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63481] [NV1A] No monitor signal since commit
 ebb945a94 (3.7-rc1)
Date: Mon, 19 Aug 2013 23:53:39 +0000
Message-ID: <bug-63481-8800-tinkrySJJi@http.bugs.freedesktop.org/>
References: <bug-63481-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0828369133=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-63481-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0828369133==
Content-Type: multipart/alternative; boundary="1376956419.daB1C8823.11818"; charset="us-ascii"


--1376956419.daB1C8823.11818
Date: Mon, 19 Aug 2013 23:53:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63481

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Nouveau driver - No         |[NV1A] No monitor signal
                   |monitor signal on chipset   |since commit ebb945a94
                   |NV1A (family NV10) since    |(3.7-rc1)
                   |bisected bad commit         |
                   |ebb945a94bba2ce8dff7b0942ff |
                   |2b3f2a52a0a69 in kernel     |
                   |3.7.9                       |

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I've tried the direct approach here of staring at the commit. It all seems
generally plausible, but as you probably noticed, it's quite rather large.

I think that the way to go for solving this will be to run an mmiotrace of it
working and then not working, and compare. Once we know exactly which functions
aren't being called, it should be easier to figure out why. Would you be up for
putting the two mmiotraces together? Here's a guide on how to do it:
https://wiki.ubuntu.com/X/MMIOTracing (but replace "nvidia" with "nouveau").
You'll obviously need to compile nouveau as a module.

BTW, I assume that the monitor goes blank as soon as the modesetting happens,
not when X starts? It does seem to find your monitor, X gets EDID (which
another NV1A user isn't getting, odd). But it just never turns the crtc on...
or something.

Also, could you provide some details about the physical hookup -- is this DVI-D
(digital) or VGA/DVI-A (analog)? Is there just a single connector or are there
multiple ones? What type(s) of connector?

Lastly, might be worthwhile to just try the latest and greatest kernel
(3.11-rc6). I have pretty low hopes for a fix to nv1a going in since 3.9, but
who knows, something could have jiggered it.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376956419.daB1C8823.11818
Date: Mon, 19 Aug 2013 23:53:39 +0000
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
   title="NEW --- - [NV1A] No monitor signal since commit ebb945a94 (3.7-rc1)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63481">bug 63481</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>Nouveau driver - No  monitor signal on chipset NV1A (family NV10) since bisected bad commit  ebb945a94bba2ce8dff7b0942ff2b3f2a52a0a69 in kernel 3.7.9
           </td>
           <td>[NV1A] No monitor signal since commit ebb945a94 (3.7-rc1)
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV1A] No monitor signal since commit ebb945a94 (3.7-rc1)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63481#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV1A] No monitor signal since commit ebb945a94 (3.7-rc1)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63481">bug 63481</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I've tried the direct approach here of staring at the commit. It all seems
generally plausible, but as you probably noticed, it's quite rather large.

I think that the way to go for solving this will be to run an mmiotrace of it
working and then not working, and compare. Once we know exactly which functions
aren't being called, it should be easier to figure out why. Would you be up for
putting the two mmiotraces together? Here's a guide on how to do it:
<a href="https://wiki.ubuntu.com/X/MMIOTracing">https://wiki.ubuntu.com/X/MMIOTracing</a> (but replace &quot;nvidia&quot; with &quot;nouveau&quot;).
You'll obviously need to compile nouveau as a module.

BTW, I assume that the monitor goes blank as soon as the modesetting happens,
not when X starts? It does seem to find your monitor, X gets EDID (which
another NV1A user isn't getting, odd). But it just never turns the crtc on...
or something.

Also, could you provide some details about the physical hookup -- is this DVI-D
(digital) or VGA/DVI-A (analog)? Is there just a single connector or are there
multiple ones? What type(s) of connector?

Lastly, might be worthwhile to just try the latest and greatest kernel
(3.11-rc6). I have pretty low hopes for a fix to nv1a going in since 3.9, but
who knows, something could have jiggered it.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376956419.daB1C8823.11818--

--===============0828369133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0828369133==--
