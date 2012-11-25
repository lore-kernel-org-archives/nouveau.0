From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: SVIDEO and xrandr
Date: Sun, 25 Nov 2012 23:56:35 +0000
Message-ID: <50B2B033.4030803@gmail.com>
References: <20121125084608.GA5165@miniwade>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20121125084608.GA5165@miniwade>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Wade Berrier <wberrier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 25/11/12 08:46, Wade Berrier wrote:
> Hello,
> 
> I've been trying to get my n17 card to do SVIDEO tv out
> 
> --------------------------
> 01:00.0 VGA compatible controller: NVIDIA Corporation NV17 [GeForce4 MX 440] (rev a3)
> --------------------------
> 
> It is close to working.  The first issue is that it was outputting PAL, and I
> found the module parameter and kernel boot config to change that:
> 
> --------------------------
> nouveau.tv_norm=NTSC-M
> --------------------------
> 
> That makes the picture look much better, but the colors are still off.
> 
> Then I notice that the card thinks it's outputting COMPOSITE instead of SVIDEO:
> 
> --------------------------
> wberrier@myth:~$ xrandr --prop
> Screen 0: minimum 320 x 200, current 640 x 480, maximum 4096 x 4096
> VGA-1 disconnected (normal left inverted right x axis y axis)
> TV-1 connected 640x480+0+0 (normal left inverted right x axis y axis) 0mm x 0mm
>         overscan: 50 (0x00000032)       range:  (0,100)
>         hue: 0 (0x00000000)     range:  (0,100)
>         saturation: 50 (0x00000032)     range:  (0,100)
>         flicker reduction: 50 (0x00000032)      range:  (0,100)
>         mode:   NTSC-M
>                 supported: PAL          PAL-M        PAL-N        PAL-Nc      
>                            NTSC-M       NTSC-J      
>         subconnector:   Composite
>                 supported: Unknown      Composite    SVIDEO       Component   
>                            SCART       
>         select subconnector:    Automatic
>                 supported: Automatic    Composite    SVIDEO       Component   
>                            SCART       
>    720x480        59.9 +
>    1024x768       59.9  
>    800x600        59.9  
>    720x576        59.9  
>    640x480        59.9* 
>    400x300       119.9                                                                                                                                                    
>    320x240       119.9  
>    320x200       119.9  
> --------------------------
> 
> When trying to change the subconnector it to SVIDEO, it fails:
> 
> --------------------------
> wberrier@myth:~$ xrandr --output TV-1 --set subconnector SVIDEO
> X Error of failed request:  BadValue (integer parameter out of range for operation)
>   Major opcode of failed request:  149 (RANDR)
>   Minor opcode of failed request:  13 (RRChangeOutputProperty)
>   Value in failed request:  0x52
>   Serial number of failed request:  29
>   Current serial number in output stream:  30
> --------------------------
> 
> It appears that other people on the net are also having this issue.
> 
> I dug around the kernel nouveau/drm source and found where the default for
> COMPOSITE gets set, and also discovered that the "override_conntype" wasn't
> what I was looking for.
> 
> Any help about how to solve this and what the best method is?
> 
> An additional module parameter for nouveau may be nice for forcing the
> subconnector.
> 
> Fixing xrandr to work would also be nice, as it also fails to set the mode:
> 
> --------------------------
> wberrier@myth:~$ xrandr --output TV-1 --set mode PAL
> X Error of failed request:  BadValue (integer parameter out of range for operation)
>   Major opcode of failed request:  149 (RANDR)
>   Minor opcode of failed request:  13 (RRChangeOutputProperty)
>   Value in failed request:  0x52
>   Serial number of failed request:  29
>   Current serial number in output stream:  30
> --------------------------
> 
> Help?
> 
> Wade
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
> 

Hi Wade

If you look at nv17_tv.c it will answer all your questions

It boils down to nv17_tv_set_property()

* if (property == conf->tv_mode_property) {
  	if (connector->dpms != DRM_MODE_DPMS_OFF)
  		return -EINVAL;
* if (property == conf->tv_select_subconnector_property) {
  	if (tv_norm->kind != TV_ENC_MODE)
  		return -EINVAL;

For a list of TV_ENC_MODE vs CTV_ENC_MODE take a look in nv17_tv_modes.c

Have fun :P
