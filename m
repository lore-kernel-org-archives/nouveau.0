From: "Thomas Schneider" <c.monty-S0/GAf8tV78@public.gmane.org>
Subject: System fails to boot w/o boot option "nomodeset"
Date: Tue, 8 Apr 2014 17:40:45 +0200
Message-ID: <trinity-86077d40-e48f-4074-96c6-9f447a8fd650-1396971645493@3capp-webde-bs12>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1478815660=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

--===============1478815660==
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>Hello!</div>

<div>&nbsp;</div>

<div>I&#39;m using rather old hardware:</div>

<div>Mainboard (Asus A7N8X)</div>

<div>AGP (Asus V7700)</div>

<div>
<pre class="notranslate">manfred@pc1:~&#36; lspci -v &#124; grep VGA
03:00.0 VGA compatible controller: NVIDIA Corporation NV15 [GeForce2 GTS/Pro] (rev a3) (prog-if 00 [VGA controller])</pre>
</div>

<div>My operating system is SolydX based on Debian Testing.</div>

<div>&nbsp;</div>

<div>The issue is that I cannot start the system w/o boot option &quot;nomodeset&quot;.</div>

<div>I get this information after displaying Grub menu:</div>

<div>
<pre class="notranslate">Linux 3.11-2-486 wird geladen ...
Initiale Ramdisk wird geladen ...

Loading, please wait ...</pre>

<div>&nbsp;</div>

<div>Then the system is freezing and I need to hard reset.</div>
</div>

<div>&nbsp;</div>

<div>There&#39;s also an error when creating xorg.conf:</div>

<div>
<pre class="notranslate">manfred@pc1:~&#36; sudo Xorg -configure

X.Org X Server 1.14.5
Release Date: 2013-12-12
X Protocol Version 11, Revision 0
Build Operating System: Linux 3.2.0-4-amd64 i686 Debian
Current Operating System: Linux pc1-asus 3.11-2-486 #1 Debian 3.11.10-1 (2013-12-04) i686
Kernel command line: BOOT_IMAGE=/vmlinuz-3.11-2-486 root=UUID=d0dbf37e-c16b-4633-8fc1-055616704568 ro splash quiet quiet nomodeset
Build Date: 13 December 2013  10:45:09AM
xorg-server 2:1.14.5-1 (Maarten Lankhorst &lt;maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org&gt;) 
Current version of pixman: 0.32.4
	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: &quot;/var/log/Xorg.0.log&quot;, Time: Tue Mar 25 23:02:32 2014
List of video drivers:
	openchrome
	mga
	tdfx
	trident
	vmware
	mach64
	cirrus
	siliconmotion
	savage
	modesetting
	ati
	intel
	radeon
	r128
	sisusb
	ztv
	qxl
	geode
	neomagic
	nouveau
	spiceqxl
	fbdev
	vesa
(++) Using config file: &quot;/root/xorg.conf.new&quot;
(==) Using system config directory &quot;/usr/share/X11/xorg.conf.d&quot;
Number of created screens does not match number of detected devices.
  Configuration failed.
(EE) Server terminated with error (2). Closing log file.</pre>

<div>&nbsp;</div>

<div>Nouveau driver is installed:</div>

<div>
<pre class="notranslate">manfred@pc1:~&#36; apt-cache policy xserver-xorg-video-nouveau
xserver-xorg-video-nouveau:
  Installiert:           1:1.0.10-1
  Installationskandidat: 1:1.0.10-1</pre>

<div>&nbsp;</div>

<div>Question:</div>

<div>What&#39;s causing this issue?</div>

<div>And how can I fix it?</div>

<div>&nbsp;</div>

<div>THX</div>
</div>
</div>

<div>
<pre class="notranslate">&nbsp;</pre>
</div></div></body></html>

--===============1478815660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1478815660==--
