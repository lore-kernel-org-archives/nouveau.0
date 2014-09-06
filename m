From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83550] [NVA5] Monitor not restored after resume
	[regression]
Date: Sat, 06 Sep 2014 02:45:15 +0000
Message-ID: <bug-83550-8800-MPB1g4vrye@http.bugs.freedesktop.org/>
References: <bug-83550-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1910427173=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-83550-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1910427173==
Content-Type: multipart/alternative; boundary="1409971514.5dF6e1.29180"; charset="us-ascii"


--1409971514.5dF6e1.29180
Date: Sat, 6 Sep 2014 02:45:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=83550

--- Comment #2 from Hjulle <anka.213.bacn+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Here is the output of xrandr after the failed resume. DVI-I-1 is not restored.

> xrandr
Screen 0: minimum 320 x 200, current 2560 x 1024, maximum 8192 x 8192
DVI-I-1 connected primary 1280x1024+0+0 (normal left inverted right x axis y
axis) 376mm x 301mm
   1280x1024     60.02*+  75.02  
   1280x960      60.00  
   1152x864      75.00  
   1024x768      75.08    70.07    60.00  
   832x624       74.55  
   800x600       72.19    75.00    60.32    56.25  
   640x480       75.00    72.81    66.67    60.00  
   720x400       70.08  
VGA-1 connected 1280x1024+1280+0 (normal left inverted right x axis y axis)
337mm x 270mm
   1280x1024     60.02*+  75.02  
   1152x864      75.00  
   1024x768      75.08    70.07    60.00  
   832x624       74.55  
   800x600       72.19    75.00    60.32  
   640x480       75.00    72.81    60.00  
   720x400       70.08  
HDMI-1 disconnected (normal left inverted right x axis y axis)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409971514.5dF6e1.29180
Date: Sat, 6 Sep 2014 02:45:14 +0000
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
   title="NEW --- - [NVA5] Monitor not restored after resume [regression]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83550#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA5] Monitor not restored after resume [regression]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83550">bug 83550</a>
              from <span class="vcard"><a class="email" href="mailto:anka.213.bacn+freedesktop&#64;gmail.com" title="Hjulle &lt;anka.213.bacn+freedesktop&#64;gmail.com&gt;"> <span class="fn">Hjulle</span></a>
</span></b>
        <pre>Here is the output of xrandr after the failed resume. DVI-I-1 is not restored.

<span class="quote">&gt; xrandr</span >
Screen 0: minimum 320 x 200, current 2560 x 1024, maximum 8192 x 8192
DVI-I-1 connected primary 1280x1024+0+0 (normal left inverted right x axis y
axis) 376mm x 301mm
   1280x1024     60.02*+  75.02  
   1280x960      60.00  
   1152x864      75.00  
   1024x768      75.08    70.07    60.00  
   832x624       74.55  
   800x600       72.19    75.00    60.32    56.25  
   640x480       75.00    72.81    66.67    60.00  
   720x400       70.08  
VGA-1 connected 1280x1024+1280+0 (normal left inverted right x axis y axis)
337mm x 270mm
   1280x1024     60.02*+  75.02  
   1152x864      75.00  
   1024x768      75.08    70.07    60.00  
   832x624       74.55  
   800x600       72.19    75.00    60.32  
   640x480       75.00    72.81    60.00  
   720x400       70.08  
HDMI-1 disconnected (normal left inverted right x axis y axis)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409971514.5dF6e1.29180--

--===============1910427173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1910427173==--
