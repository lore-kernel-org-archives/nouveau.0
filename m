From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79522] [NV67] Possible Regression 3.14.4+
Date: Mon, 28 Jul 2014 08:54:48 +0000
Message-ID: <bug-79522-8800-BkB5PlcgvT@http.bugs.freedesktop.org/>
References: <bug-79522-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0340382654=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79522-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0340382654==
Content-Type: multipart/alternative; boundary="1406537687.A5DcBC4c1.4741"; charset="us-ascii"


--1406537687.A5DcBC4c1.4741
Date: Mon, 28 Jul 2014 08:54:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79522

Mike <storkus-FfzuIwEQ1aBBDgjK7y7TUQ@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #2 from Mike <storkus-FfzuIwEQ1aBBDgjK7y7TUQ@public.gmane.org> ---
Update: my laptop's display totally died yesterday--no backlight OR anything
displayed in reflected light.  Booting in Vista (which I had saved on the old
hard driver that came with it when I replaced it with an SSD) didn't change
anything.  Vista showed no monitor present other than the external one I had
connected, which it read as PnP generic.

One oddity: both Vista and the BIOS Int13 displayed on an external SVGA monitor
just fine, yet Slackware 14.1 updated to 3.14.12(?) would not--yet some Nouveau
versions, including 3.10.17 that came stock when Slackware 14.1 came out, did
just fine as I was using Nouveau at a couple of LUG meetings talking to a
projector.

Anyway, at this point I think its near-impossible to state whether Nouveau
screwed with something in BIOS it should have, or this was an intermittent
hardware failure that coincidentally started when I upgraded to kernel 3.14
(stranger things have happened), or what, but at 7 years old, I've been
thinking for a while of replacing this laptop--guess I have a good reason now.

Marking this resolved-invalid unless any of you can think of a reason why not.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1406537687.A5DcBC4c1.4741
Date: Mon, 28 Jul 2014 08:54:47 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:storkus&#64;storkus.com" title="Mike &lt;storkus&#64;storkus.com&gt;"> <span class="fn">Mike</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED INVALID - [NV67] Possible Regression 3.14.4+"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79522">bug 79522</a>
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
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>INVALID
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED INVALID - [NV67] Possible Regression 3.14.4+"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79522#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED INVALID - [NV67] Possible Regression 3.14.4+"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79522">bug 79522</a>
              from <span class="vcard"><a class="email" href="mailto:storkus&#64;storkus.com" title="Mike &lt;storkus&#64;storkus.com&gt;"> <span class="fn">Mike</span></a>
</span></b>
        <pre>Update: my laptop's display totally died yesterday--no backlight OR anything
displayed in reflected light.  Booting in Vista (which I had saved on the old
hard driver that came with it when I replaced it with an SSD) didn't change
anything.  Vista showed no monitor present other than the external one I had
connected, which it read as PnP generic.

One oddity: both Vista and the BIOS Int13 displayed on an external SVGA monitor
just fine, yet Slackware 14.1 updated to 3.14.12(?) would not--yet some Nouveau
versions, including 3.10.17 that came stock when Slackware 14.1 came out, did
just fine as I was using Nouveau at a couple of LUG meetings talking to a
projector.

Anyway, at this point I think its near-impossible to state whether Nouveau
screwed with something in BIOS it should have, or this was an intermittent
hardware failure that coincidentally started when I upgraded to kernel 3.14
(stranger things have happened), or what, but at 7 years old, I've been
thinking for a while of replacing this laptop--guess I have a good reason now.

Marking this resolved-invalid unless any of you can think of a reason why not.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1406537687.A5DcBC4c1.4741--

--===============0340382654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0340382654==--
