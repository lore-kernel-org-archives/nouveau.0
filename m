From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71472] [NV108] GT-740M not detected (mmiotrace)
Date: Tue, 26 Nov 2013 02:15:24 +0000
Message-ID: <bug-71472-8800-6iVUV3Y0Fw@http.bugs.freedesktop.org/>
References: <bug-71472-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1307568333=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71472-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1307568333==
Content-Type: multipart/alternative; boundary="1385432124.Df1D2.17031"; charset="us-ascii"


--1385432124.Df1D2.17031
Date: Tue, 26 Nov 2013 02:15:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71472

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|---                         |NOTABUG

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
If you grab envytools from git, demmio should be fixed.

However I'll reiterate -- your gpu has no outputs, so it's only good for 3d
acceleration. With the nouveau driver compiled from
http://cgit.freedesktop.org/~darktama/nouveau/log/?h=devel-pm (and the graph
firmware extracted as per the earlier instructions) you might have a
functioning graph unit [I'm not even sure of that], but the current mesa has no
knowledge of the GK208 (NV108), and is quite unlikely to work. I think that
GK208 is similar to GK110 in terms of ISA, which has dodgy-at-best support
presently in mesa, so I wouldn't expect any quick miracles.

If you're interested in working on this yourself, join us in #nouveau,
otherwise wait a few months before trying again. I'm closing this, since
there's no point in having it open -- the GK208 just isn't supported atm, esp
wrt 3d accel.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385432124.Df1D2.17031
Date: Tue, 26 Nov 2013 02:15:24 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - [NV108] GT-740M not detected (mmiotrace)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71472">bug 71472</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>REOPENED
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>NOTABUG
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - [NV108] GT-740M not detected (mmiotrace)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71472#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - [NV108] GT-740M not detected (mmiotrace)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71472">bug 71472</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>If you grab envytools from git, demmio should be fixed.

However I'll reiterate -- your gpu has no outputs, so it's only good for 3d
acceleration. With the nouveau driver compiled from
<a href="http://cgit.freedesktop.org/~darktama/nouveau/log/?h=devel-pm">http://cgit.freedesktop.org/~darktama/nouveau/log/?h=devel-pm</a> (and the graph
firmware extracted as per the earlier instructions) you might have a
functioning graph unit [I'm not even sure of that], but the current mesa has no
knowledge of the GK208 (NV108), and is quite unlikely to work. I think that
GK208 is similar to GK110 in terms of ISA, which has dodgy-at-best support
presently in mesa, so I wouldn't expect any quick miracles.

If you're interested in working on this yourself, join us in #nouveau,
otherwise wait a few months before trying again. I'm closing this, since
there's no point in having it open -- the GK208 just isn't supported atm, esp
wrt 3d accel.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385432124.Df1D2.17031--

--===============1307568333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1307568333==--
