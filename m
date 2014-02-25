From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75511] [NVE7] Unknown opcode in VBIOS on one of 2
 cards, fails boot on 3.13+
Date: Tue, 25 Feb 2014 23:11:33 +0000
Message-ID: <bug-75511-8800-d5xL1BcFn8@http.bugs.freedesktop.org/>
References: <bug-75511-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0401108066=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75511-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0401108066==
Content-Type: multipart/alternative; boundary="1393369893.0D540771.8618"; charset="us-ascii"


--1393369893.0D540771.8618
Date: Tue, 25 Feb 2014 23:11:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75511

--- Comment #2 from Claas Lorenz <cllorenz-KiJTPfjSHVUubQSw3dWLiw@public.gmane.org> ---
Created attachment 94736
  --> https://bugs.freedesktop.org/attachment.cgi?id=94736&action=edit
output of "cat /sys/bus/pci/devices/0000:01:00.0/rom > vbios-0.rom"

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393369893.0D540771.8618
Date: Tue, 25 Feb 2014 23:11:33 +0000
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
   title="NEW --- - [NVE7] Unknown opcode in VBIOS on one of 2 cards, fails boot on 3.13+"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75511#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] Unknown opcode in VBIOS on one of 2 cards, fails boot on 3.13+"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75511">bug 75511</a>
              from <span class="vcard"><a class="email" href="mailto:cllorenz&#64;uni-potsdam.de" title="Claas Lorenz &lt;cllorenz&#64;uni-potsdam.de&gt;"> <span class="fn">Claas Lorenz</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=94736" name="attach_94736" title="output of &quot;cat /sys/bus/pci/devices/0000:01:00.0/rom &gt; vbios-0.rom&quot;">attachment 94736</a> <a href="attachment.cgi?id=94736&amp;action=edit" title="output of &quot;cat /sys/bus/pci/devices/0000:01:00.0/rom &gt; vbios-0.rom&quot;">[details]</a></span>
output of &quot;cat /sys/bus/pci/devices/0000:01:00.0/rom &gt; vbios-0.rom&quot;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393369893.0D540771.8618--

--===============0401108066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0401108066==--
