From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82834] [NV92] GeForce 8800 GS shows incorrect
 temperature with nouveau
Date: Thu, 21 Aug 2014 12:07:12 +0000
Message-ID: <bug-82834-8800-y6UOWSgCbl@http.bugs.freedesktop.org/>
References: <bug-82834-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1905133603=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82834-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1905133603==
Content-Type: multipart/alternative; boundary="1408622832.1A7Ab4eD2.17681"; charset="us-ascii"


--1408622832.1A7Ab4eD2.17681
Date: Thu, 21 Aug 2014 12:07:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82834

--- Comment #9 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
(In reply to comment #8)
> Not  worked  with NVIDIA-Linux-x86-325.15.run (no temperature  data in
> nvidia-settings,  no temperature  data  in nvidia-smi output).
> 
> I also  found  those  threads:
> http://en.expreview.com/2008/01/21/review-palit-8800gs-384mb-768mb/214.html/
> 25
> http://www.techpowerup.com/forums/threads/palit-geforce-8800gs-384mb-with-no-
> sensor-and-two-pin-fan.61530/
> 
> so, may be  this  is  hardware defect ...

Possibly... I'll add a test and only display the temperature if the test
succeeds. This way, people won't be mislead into thinking their temperature
probe works but is not accurate.

Thank you for reporting the bug though! I'll close it when I have submitted the
patch.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1408622832.1A7Ab4eD2.17681
Date: Thu, 21 Aug 2014 12:07:12 +0000
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
   title="NEW --- - [NV92] GeForce 8800 GS shows incorrect temperature with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82834#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV92] GeForce 8800 GS shows incorrect temperature with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82834">bug 82834</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=82834#c8">comment #8</a>)
<span class="quote">&gt; Not  worked  with NVIDIA-Linux-x86-325.15.run (no temperature  data in
&gt; nvidia-settings,  no temperature  data  in nvidia-smi output).
&gt; 
&gt; I also  found  those  threads:
&gt; <a href="http://en.expreview.com/2008/01/21/review-palit-8800gs-384mb-768mb/214.html/">http://en.expreview.com/2008/01/21/review-palit-8800gs-384mb-768mb/214.html/</a>
&gt; 25
&gt; <a href="http://www.techpowerup.com/forums/threads/palit-geforce-8800gs-384mb-with-no">http://www.techpowerup.com/forums/threads/palit-geforce-8800gs-384mb-with-no</a>-
&gt; sensor-and-two-pin-fan.61530/
&gt; 
&gt; so, may be  this  is  hardware defect ...</span >

Possibly... I'll add a test and only display the temperature if the test
succeeds. This way, people won't be mislead into thinking their temperature
probe works but is not accurate.

Thank you for reporting the bug though! I'll close it when I have submitted the
patch.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1408622832.1A7Ab4eD2.17681--

--===============1905133603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1905133603==--
