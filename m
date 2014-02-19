From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75199] [NVD7] unsupported GT620M in Samsung
 All-in-One PC DP500A2D
Date: Wed, 19 Feb 2014 15:01:05 +0000
Message-ID: <bug-75199-8800-NkHDTrrppM@http.bugs.freedesktop.org/>
References: <bug-75199-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1307463211=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75199-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1307463211==
Content-Type: multipart/alternative; boundary="1392822065.54DF2CB2.5552"; charset="us-ascii"


--1392822065.54DF2CB2.5552
Date: Wed, 19 Feb 2014 15:01:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75199

Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|unsupported GT620M in       |[NVD7] unsupported GT620M
                   |Samsung All-in-One PC       |in Samsung All-in-One PC
                   |DP500A2D                    |DP500A2D

--- Comment #1 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Seems like bbswitch is not powering the card properly.

I would recommend removing bbswitch and using the kernel's dynamic power
management (iirc it landed in 3.12). The latter should power off the nvidia
card when not in use and bring it back up if you run DRI_PRIME=1 glxgears

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392822065.54DF2CB2.5552
Date: Wed, 19 Feb 2014 15:01:05 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD7] unsupported GT620M in Samsung All-in-One PC DP500A2D"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75199">bug 75199</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>unsupported GT620M in Samsung All-in-One PC DP500A2D
           </td>
           <td>[NVD7] unsupported GT620M in Samsung All-in-One PC DP500A2D
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD7] unsupported GT620M in Samsung All-in-One PC DP500A2D"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75199#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD7] unsupported GT620M in Samsung All-in-One PC DP500A2D"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75199">bug 75199</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Seems like bbswitch is not powering the card properly.

I would recommend removing bbswitch and using the kernel's dynamic power
management (iirc it landed in 3.12). The latter should power off the nvidia
card when not in use and bring it back up if you run DRI_PRIME=1 glxgears</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392822065.54DF2CB2.5552--

--===============1307463211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1307463211==--
