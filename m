From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54437] linux-nouveau2.6 (3.6.0-rc4) : GTX580 : Xorg
 freezes when using accel
Date: Mon, 19 Aug 2013 18:20:17 +0000
Message-ID: <bug-54437-8800-VBMRmHX3s2@http.bugs.freedesktop.org/>
References: <bug-54437-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0460751594=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54437-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0460751594==
Content-Type: multipart/alternative; boundary="1376936417.d4b60cA32.22255"; charset="us-ascii"


--1376936417.d4b60cA32.22255
Date: Mon, 19 Aug 2013 18:20:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54437

Kelly Doran <kel.p.doran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Priority|medium                      |high

--- Comment #3 from Kelly Doran <kel.p.doran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
This bug persists.  I consider it to be a pretty serious bug, too.  Anyone with
an nvc8 card who runs Gnome or Unity will have the card freeze up in seconds,
although somewhat less frequently with KDE.  Running firefox will immediately
freeze the card.  Ubuntu and Fedora both ship their liveCDs to enable nouveau
by default and people cannot even run the installer for more than a minute, and
most will have no idea what went wrong.  Note that most nvc0 cards run just
fine... I even have a nvc4 on another computer that runs perfectly, it is nvc8
that specifically has this problem, which very few (if any?) devs seem to
posess.  Feel free to google "nouveau gtx 580" to see that this is hitting a
decent amount of people.

The card works just fine if using the extracted firmware, but this is a poor
solution.  I have been reading the various envytools/hwdocs on the fuc and been
trying to investigate this but I have hit a wall, this issue is just too
difficult for me to handle.  I am pretty sure the solution is to do whatever
Ben did to get the nvd7/nvd9 cards working, which looked like adding chipset
specific firmware data to the loading code, but I don't know nearly enough to
do this myself.  If anyone has some advice, please let me know, I would really
like to see this bug closed.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376936417.d4b60cA32.22255
Date: Mon, 19 Aug 2013 18:20:17 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:kel.p.doran&#64;gmail.com" title="Kelly Doran &lt;kel.p.doran&#64;gmail.com&gt;"> <span class="fn">Kelly Doran</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - linux-nouveau2.6 (3.6.0-rc4) : GTX580 : Xorg freezes when using accel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54437">bug 54437</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Priority</td>
           <td>medium
           </td>
           <td>high
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - linux-nouveau2.6 (3.6.0-rc4) : GTX580 : Xorg freezes when using accel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54437#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - linux-nouveau2.6 (3.6.0-rc4) : GTX580 : Xorg freezes when using accel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54437">bug 54437</a>
              from <span class="vcard"><a class="email" href="mailto:kel.p.doran&#64;gmail.com" title="Kelly Doran &lt;kel.p.doran&#64;gmail.com&gt;"> <span class="fn">Kelly Doran</span></a>
</span></b>
        <pre>This bug persists.  I consider it to be a pretty serious bug, too.  Anyone with
an nvc8 card who runs Gnome or Unity will have the card freeze up in seconds,
although somewhat less frequently with KDE.  Running firefox will immediately
freeze the card.  Ubuntu and Fedora both ship their liveCDs to enable nouveau
by default and people cannot even run the installer for more than a minute, and
most will have no idea what went wrong.  Note that most nvc0 cards run just
fine... I even have a nvc4 on another computer that runs perfectly, it is nvc8
that specifically has this problem, which very few (if any?) devs seem to
posess.  Feel free to google &quot;nouveau gtx 580&quot; to see that this is hitting a
decent amount of people.

The card works just fine if using the extracted firmware, but this is a poor
solution.  I have been reading the various envytools/hwdocs on the fuc and been
trying to investigate this but I have hit a wall, this issue is just too
difficult for me to handle.  I am pretty sure the solution is to do whatever
Ben did to get the nvd7/nvd9 cards working, which looked like adding chipset
specific firmware data to the loading code, but I don't know nearly enough to
do this myself.  If anyone has some advice, please let me know, I would really
like to see this bug closed.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376936417.d4b60cA32.22255--

--===============0460751594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0460751594==--
